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

    pokemon_serach = db.execute.(sql, id)
  end.first



end
