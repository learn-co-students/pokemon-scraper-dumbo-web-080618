class Pokemon

  attr_accessor :name, :id, :type, :db, :hp


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end

  def self.save(n_name ,n_type, db)
    db.execute "INSERT INTO pokemon (name, type) VALUES ('#{n_name}', '#{n_type}')"
  end

  def self.find(id, db)
    name = (db.execute "SELECT * FROM pokemon WHERE id = #{id}").flatten
    self.new(id: name[0], name: name[1], type: name[2], db: db)
  end

  def alter_hp(hp, db)

    x = db.execute "UPDATE pokemon SET hp = #{hp} WHERE name = '#{name}'"
    binding.pry
  end



end
