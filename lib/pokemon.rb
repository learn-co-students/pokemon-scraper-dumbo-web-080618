require "pry"
class Pokemon
  attr_accessor :name, :id,:type, :db
  @@all = []

def initialize (id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  @@all << self
end

def self.id_finder(name,type)
  found_pokemon = self.all.find do |pokemon|
                    pokemon.name == name && pokemon.type == type
                  end
  found_pokemon.id
end


def self.save (name,type,db)
  id = id_finder(name,type)
  db.execute("INSERT INTO pokemon (id, name, type ) VALUES (?,?,?)", id, name, type)
end

def self.find (id,db)
  found_pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
  name = found_pokemon_data[0][1]
  type = found_pokemon_data[0][2]
  self.new(id: id,name: name,type: type,db: db)
end



def self.all
 @@all
end

end
