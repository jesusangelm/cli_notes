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

    # loop de actiones
    #   que se quiere hacer? (listar, buscar, agregar. salir)
    #   hacer esa accion
    # repetir hasta que el usuario salga
    #
    # mensaje de despedida
    goodbye
  end

  def welcome
    puts "\n\n<<<< Bienvenido a Notas >>>>\n\n"
    puts "Esta es una aplicacion de linea de comandos basica para almacenar notas.\n\n"
  end

  def goodbye
    puts "\n<<<< Hasta luego! >>>>\n\n\n"
  end

end
