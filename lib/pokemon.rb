require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id, name, type, db)
    @name = name
    @id = id
    @type = type
    @db = db
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
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    pokemon = db.execute(sql, id).flatten
    Pokemon.new(pokemon[0], pokemon[1], pokemon[2], db)
  end


end
