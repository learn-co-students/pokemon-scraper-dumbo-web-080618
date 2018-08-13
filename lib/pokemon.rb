require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  # def initialize(id)
  #   @id = id
  #   @@all << self
  #   @hp = 60
  # end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    # binding.pry
    poke = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    p = Pokemon.new(id: id, name: poke[0][1], type: poke[0][2], db: db, hp: poke[0][3])
    # p.name = poke[0][1]
    # p.type = poke[0][2]
    # p
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", @hp, @id)
  end
end
