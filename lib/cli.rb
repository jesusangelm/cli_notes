class Cli

  def initialize(path=nil)
    #localizar el archivo notas.txt en la path (ruta)
    #o crea un archivo nota.txt nuevo en caso de que no exista
    #salir si la creacion del archivo falla.
  end

  def launch!
    # mensaje bienvenida
    bienvenida

    # loop de actiones
    #   que se quiere hacer? (listar, buscar, agregar. salir)
    #   hacer esa accion
    # repetir hasta que el usuario salga
    #
    # mensaje de despedida
    despedida
  end

  def bienvenida
    puts "\n\n<<<< Bienvenido a Notas >>>>\n\n"
    puts "Esta es una aplicacion de linea de comandos basica para almacenar notas.\n\n"
  end

  def despedida
    puts "\n<<<< Hasta luego! >>>>\n\n\n"
  end

end
