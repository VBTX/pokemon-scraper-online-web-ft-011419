

class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

    def initialize (id:, name:, type:, hp:, db:)
    @id= id
    @name = name
    @type = type
    @db = db
    @hp = nil
    end

    def self.all
    @@all
    end

    def self.save(name, type, hp, db)
    db.execute("INSERT INTO pokemon(name, type, hp) VALUES (?, ?)", name, type, hp)
    end

    def self.find(id, hp, db)
        pokemon = db.execute('SELECT * FROM pokemon WHERE id=?', id)
        Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db, hp: hp)
    end

    def alter_hp(new_hp)
       db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
    end

end
