require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  # objective: save and find
  def initialize(id:, name:, type:, hp: nil, db:)
      @id = id
      @name = name
      @type = type
      @hp = hp
      @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)" ,name, type)
  end
  # .find without BONUS
  # def self.find(id, db)
  #   pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
  #   Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
  # end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
