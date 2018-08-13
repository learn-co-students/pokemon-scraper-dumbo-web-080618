require "pry"
class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id: , name: , type: , db: )
    @name = name
    @id =  id
    @type = type
    @db = db

  end
  def self.save(name, type, db) # saves an instance of a pokemon with the correct id
    db.execute("INSERT INTO pokemon(name, type) VAlUES(?,?)", name, type)
  end
  def self.find(id, db)
    execu = db.execute("SELECT * FROM pokemon WHERE id = ? ", id) #id = ? is the value for the id
    self.new(id: execu[0][0] , name: execu[0][1] , type: execu[0][2] , db: db) #finds a pokemon from the database by their id number and returns a new Pokemon object
    # binding.pry
  end

end
