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

  def self.find (id, db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL

   new_pokemon = db.execute.(sql, id)
   id = new_pokemon[0]
   name = new_pokemon[1]
   type = new_pokemon[2]

   pokemon = Pokemon.new (id: id, name: name, type: type)
     

  end


end
