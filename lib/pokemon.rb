class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (pokemon)
    @pokemon = pokemon
  end

  def self.save (name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
    db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]

    pokemon_inst = Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
  end


end
