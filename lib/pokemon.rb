require "pry"

class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(new_name, new_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{new_name}', '#{new_type}')")
  end

  def self.find(new_id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = #{new_id}").flatten!
    id = poke[0]
    name = poke[1]
    type = poke[2]
    db = @db
    self.new(id: id, name: name, type: type, db: db, hp: poke[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
  end

end
