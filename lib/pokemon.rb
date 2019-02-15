

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

    def initialize (id:, name:, type:, db:, hp:)
    @id= id
    @name = name
    @type = type
    @db = db
    @hp = hp
    end

    def self.all
    @@all
    end

    def self.save(name, type, hp, db)
    db.execute("INSERT INTO pokemon(name, type, hp) VALUES (?, ?)", name, type)
    end

    def self.find(id, hp, db)
        pokemon = db.execute('SELECT * FROM pokemon WHERE id=?', id)
        Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db, hp: hp)
    end

end
