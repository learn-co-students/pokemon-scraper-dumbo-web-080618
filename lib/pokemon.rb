require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    # binding.pry
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    # INSERT INTO fans (name, artist_id) VALUES ("Prince", 169);
  end

  def self.find(id, db)
    getting = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: getting[0], name: getting[1], type: getting[2], db: db)
  end

  # def bon
  # end
end
