class Note

  @@filepath = nil

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  def self.file_exist?
    # comprobamos si el archivo notas.txt existe
  end

  def self.create_file
    # creamos el archivo notas.txt
  end

  def self.saved_notes
    # lee el archivo notas.txt
    # regresa las instancias de la clase note
  end

end
