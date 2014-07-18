require "note"

class Cli

  class Config
    @@actions = ["listar", "buscar", "agregar", "salir"]
    def self.actions; @@actions; end
  end


  def initialize(path=nil)
    #localizar el archivo notas.txt en la path (ruta)
    Note.filepath = path
    if Note.file_usable?
      puts "Archivo notas.txt encontrado."
    #o crea un archivo nota.txt nuevo en caso de que no exista
    elsif Note.create_file
      puts "Archivo notas.txt creado."
    else
      #salir si la creacion del archivo falla.
      puts "Saliendo...\n\n"
      exit!
    end


  end

  def launch!
    # mensaje bienvenida
    welcome

    # bucle de actiones
    result = nil
    until result == :quit
      action = get_action
      result = do_action(action)
    end
    # mensaje de despedida
    goodbye
  end

  def get_action
    action = nil
    until Cli::Config.actions.include?(action)
      puts "Comandos soportados: " + Cli::Config.actions.join(", ") if action
      print "> "
      user_response = gets.chomp
      action = user_response.downcase.strip
    end
    return action
  end

  def do_action(action)
    case action
    when "listar"
      list
    when "buscar"
      puts "buncando notas..."
    when "agregar"
      add
    when "salir"
      return :quit
    else
      puts "\nNo soporto el comando #{action}, intenta de nuevo.\n"
    end
  end

  def list
    output_action_header("listado de notas")
    notas = Note.saved_notes
    output_note_table(notas)
  end

  def add
    output_action_header("\nAgrega una nota")

    nota = Note.build_using_questions

    if nota.save
      puts "\nNota guardada\n\n"
    else
      puts "\nError: al guardar la nota\n\n"
    end
  end

  def welcome
    puts "\n\n<<<< Bienvenido a Notas >>>>\n\n"
    puts "Esta es una aplicacion de linea de comandos basica para almacenar notas.\n\n"
  end

  def goodbye
    puts "\n<<<< Hasta luego! >>>>\n\n\n"
  end


  private

  def output_action_header(text)
    puts "\n#{text.upcase.center(30)}\n\n"
  end

  def output_note_table(notes)
    print " " + "Titulo".ljust(30)
    print " " + "Contenido".ljust(20) + "\n"
    puts "-" * 100
    notes.each do |note|
      line = " " << note.title.ljust(30).capitalize
      line << " " + note.content.ljust(20).capitalize
      puts line
    end
    puts "No se encontraron notas" if notes.empty? 
    puts "-" * 100
  end
end
