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

  db.execute.(sql, id).map do |temp|
   id = temp[0]
   name = temp[1]
   type = temp[2]

   pokemon = Pokemon.new(name, type)
   pokemon
 end.first


end
