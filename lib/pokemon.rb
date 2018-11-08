require 'pry'
class Pokemon
  attr_reader :id, :name, :type, :db
  attr_accessor :hp

  def initialize(id:, name:, type:, db:)
    @id, @name, @type, @db = id, name, type, db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    pokemon = db.execute(sql, id)
    pokemon_obj = Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db)
    pokemon_obj.hp = pokemon[0][3]
    pokemon_obj
  end
  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ?
      WHERE id = ?
    SQL
    # binding.pry
    db.execute(sql, hp, @id)
  end
end
