class PatientORM
    attr_reader :id
    attr_accessor :name, :age, :owner, :number, :species
    
    def self.create_table 
        
        # For strings that will take up multiple lines in your text editor, 
        # use a heredoc (https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails.html) to create a string that 
        # runs on to multiple lines.
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS patients (
            id INTEGER PRIMARY KEY,
            clinic_id INTEGER,
            species TEXT,
            name TEXT,
            age INTEGER,
            owner TEXT,
            number TEXT
        );
        SQL
        DB.execute(sql)
    end 

    # Will this create a new record in DB or not?
    def initialize(attributes) 
        # ACTIVITY 1 => Use mass assignment to allow attributes to be 
        # passed into initialize() as key / value pairs

        attributes.each do |key, value|
            if self.respond_to?("#{key.to_s}=")
                self.class.attr_accessor(key)
                self.send("#{key}=", value)
            end
        end

        # Example Case:
        # PatientORM.new(
        #     name: "Grace", 
        #     age: 1, 
        #     owner: "Sally",
        #     number: 2,
        #     species: "Cat"    
        # )

        # method hints => ".each", ".respond_to?", ".send"
        # https://apidock.com/ruby/Object/respond_to%3F
        # https://apidock.com/ruby/Object/send
    end

    def save
        # For strings that will take up multiple lines in your text editor, 
        # use a heredoc (https://blog.saeloun.com/2020/04/08/heredoc-in-ruby-and-rails.html) 
        # to create a string that runs on to multiple lines.
        sql = <<-SQL
        INSERT INTO patients (species, name, age, owner, number) VALUES (?,?,?,?,?);        
        SQL

        # ACTIVITY 1 => Use "execute" and "last_insert_row_id" to add new
        # PatientORM class instances to DB with appropriate IDs
        # https://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3/Database#execute-instance_method
        # https://www.rubydoc.info/github/luislavena/sqlite3-ruby/SQLite3%2FDatabase:last_insert_row_id

        DB.execute(sql, self.species, self.name, self.age, self.owner, self.number)
        @id = DB.last_insert_row_id # Don't use self.id here!

        # NOTE => Remember to return "self" instance
        # self
    end

    def self.create(args)
        # ACTIVITY 2 => Use "new" and "save" to simultaneously 
        # create / add new PatientORM class instances to DB
        new_patient = PatientORM.new(args)
        new_patient.save

        # NOTE => Remember to return "patient" instance
        new_patient
    end

    def self.all 
        # ACTIVITY 2 => Use "DB.execute()" + SQL to retrieve all 
        # patients from table.
        sql = "SELECT * FROM patients"
        patients = DB.execute(sql)

        # HINT => Use ".map" and "self.new" to create an array of "mapped_resources"
        # NOTE => Remember to return "mapped_resources" as an iterable list
        # of patients
        # You don't want them stored as hash objects but as INSTANCES of the PatientORM class stored in memory that we can use and manipulate on our end in Ruby
        mapped_resources = patients.map do |patient|
            PatientORM.new(patient)
        end
        mapped_resources
    end
end 

# {
#     name: "Mickey", age: 4, owner: "Walt", number: 1231231234, species: "Mouse"
# }