class Pokemon
  attr_accessor :id, :name, :type

  def initialize (pokemon)
    @pokemon = pokemon
  end

  def save
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end


end
