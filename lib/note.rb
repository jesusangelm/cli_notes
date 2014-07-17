class Note

  @@filepath = nil

  def self.filepath=(path=nil)
    @@filepath = File.join(APP_ROOT, path)
  end

  def self.file_exist?
    # comprobamos si el archivo notas.txt existe
    if @@filepath && File.exists?(@@filepath)
      return true
    else
      return false
    end
  end

  def self.file_usable?
    return false unless @@filepath
    return false unless File.exists?(@@filepath)
    return false unless File.readable?(@@filepath)
    return false unless File.writable?(@@filepath)
    return true
  end

  def self.create_file
    # creamos el archivo notas.txt
    File.open(@@filepath, "w") unless file_exist?
    return file_usable?
  end

  def self.saved_notes
    # lee el archivo notas.txt
    # regresa las instancias de la clase note
  end

end
