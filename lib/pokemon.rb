class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize (name, hp: 60)
    @name = name
    @hp = hp
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
    found_pokemon.hp = pokemon[0][3]
    found_pokemon
  end 

  def alter_hp(hit_points, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hit_points, self.id)
  end
end
