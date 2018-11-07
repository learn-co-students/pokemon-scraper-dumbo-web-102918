class Pokemon

  attr_reader :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokmon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    pokemon = Pokemon.new(id: pokmon[0][0], name: pokmon[0][1], type: pokmon[0][2], db: db)
    #binding.pry
  end

end
