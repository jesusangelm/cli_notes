class Note

  attr_accessor :title, :content

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

  def self.build_using_questions
    args = {}

    print "Titulo de la nota: "
    args[:title] = gets.chomp.strip

    print "Contenido de la nota: "
    args[:content] = gets.chomp.strip

    return self.new(args)
  end

  def initialize(args={})
    @title   = args[:title]   || ""
    @content = args[:content] || ""
  end

  def save
    return false unless Note.file_usable?
    File.open(@@filepath, "a") do |file|
      file.puts "#{[@title, @content].join("\t")}\n"
    end
    return true
  end

end
