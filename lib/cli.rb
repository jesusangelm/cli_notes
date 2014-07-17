require "note"

class Cli

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
    #   que se quiere hacer? (listar, buscar, agregar. salir)
      print "> "
      user_response = gets.chomp
    #   hacer esa accion
      result = do_action(user_response)
    end
    # mensaje de despedida
    goodbye
  end

  def do_action(action)
    case action
    when "listar"
      puts "listando notas..."
    when "buscar"
      puts "buncando notas..."
    when "agregar"
      puts "agregando su nota"
    when "salir"
      return :quit
    else
      puts "\nNo soporto el comando #{action}, intenta de nuevo.\n"
    end
  end

  def welcome
    puts "\n\n<<<< Bienvenido a Notas >>>>\n\n"
    puts "Esta es una aplicacion de linea de comandos basica para almacenar notas.\n\n"
  end

  def goodbye
    puts "\n<<<< Hasta luego! >>>>\n\n\n"
  end

end
