require 'pry'

class Pokemon

attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @db = db
    @name = name
    @type = type
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    poke_data = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    poke_name = poke_data[0][1]
    poke_type = poke_data[0][2]
    poke_hp = poke_data[0][3]
    #binding.pry
    new_poke = Pokemon.new(id: id, name: poke_name, type: poke_type, db:db, hp: poke_hp)
    new_poke
  end

  def alter_hp(hp, db)
    self.hp = hp
    hp_points = db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
    #binding.pry
  end

end
