require 'pry'
class Pokemon

  @@all = []
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, hp:60, db:)
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

  def self.save(name, type, db)

    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    temp = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    self.new(id:temp[0], name:temp[1], type:temp[2], hp:temp[3], db: db)

  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{@id}")

    #binding.pry
  end
end
