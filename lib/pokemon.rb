class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize (name)
    @name = name
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_num, db)
    found_pokemon = nil
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1",id_num)
    found_pokemon = self.new(pokemon[0][1])
    found_pokemon.id = pokemon[0][0] 
    found_pokemon.type = pokemon[0][2] 
    found_pokemon
  end 
end
