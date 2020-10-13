class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (pokemon)
    @pokemon = pokemon
  end

  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end


end
