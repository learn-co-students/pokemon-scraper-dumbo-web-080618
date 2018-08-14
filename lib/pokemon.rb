require "pry"

class Pokemon
  attr_accessor :name, :type, :db, :id
  def initialize(id:,name:, type:, db:)
    @name = name
    @type = type
    @id =  id
    @db = db
  end

  def self.save(name,type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    new_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    #binding.pry

    z = Pokemon.new(id:new_array[0], name:new_array[1], type:new_array[2], db:db)
    #binding.pry
    #
  end
end
