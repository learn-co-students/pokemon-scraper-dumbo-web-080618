require 'pry'

class Pokemon

attr_accessor :name, :type, :id, :db, :hp

def database_connection
   SQLite3::Database.new('../pokemon.db')
end


def initialize(name:, type:, id:, db:, hp: 60)
  # @id = id
  @hp = hp
  @id = id
  @type = type
  @name = name
  @db = database_connection
end

def self.save(name, type, database_connection)
  database_connection.execute('INSERT INTO pokemon(name, type) VALUES (?, ?)',name, type)
end

def self.find(id, database_connection)
  pokeinfo = database_connection.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
  # binding.pry
 # return self.initialize
 return self.new(hp: pokeinfo[3], id:pokeinfo[0],name:pokeinfo[1],type:pokeinfo[2], db: database_connection)
end


def alter_hp(hp, database_connection)
  # binding.pry
  database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)

end
# binding.pry

end
