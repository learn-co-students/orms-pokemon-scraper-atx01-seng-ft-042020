class Pokemon
    attr_accessor :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db) 
        sql = <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?,?)
        SQL

        res = db.execute(sql, name, type)
    end

    def self.find(id, db) 
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?;
        SQL

        res = db.execute(sql, id)
        self.new(id: res[0][0], name: res[0][1], type: res[0][2], db: db)
    end
end
