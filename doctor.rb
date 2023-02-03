require 'sqlite3'
require 'pry'

class Doctor
  DB = SQLite3::Database.new('doctors.db')
#   DB.results_as_hash = true
  attr_reader :id
  attr_accessor :name, :age, :specialty
  def initialize(attributes = {})
    @id = attributes["id"]
    @name = attributes["name"]
    @age = attributes["age"]
    @specialty = attributes["specialty"]
  end

  def self.create_table
    query = "CREATE TABLE IF NOT EXISTS `doctors` (
        `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
        `name` TEXT,
        `age` INTEGER,
        `specialty` TEXT
      )"
    DB.execute(query)
  end

  def self.all
    query = "SELECT * FROM doctors"
    DB.execute(query)
  end

  def self.find(id)
    query = "SELECT * FROM doctors WHERE id = ?"
    DB.results_as_hash = true
    DB.execute(query, id).first
  end

  def save
    query = "INSERT INTO doctors (name, age, specialty)
            VALUES (?, ?, ?)"
    DB.execute(query, @name, @age, @specialty)
  end

  def update
    query = "UPDATE doctors SET age = ?, name = ?, specialty = ? WHERE id = ?"
    DB.execute(query, @age, @name, @specialty, @id)
  end

  def self.destroy(id)
    query = "DELETE FROM doctors WHERE id = ?"
    DB.execute(query, id)
  end
end

# Método que cria as tabelas no banco
Doctor.create_table

# READ - Ler todos os doutores do Banco
all_doctors = Doctor.all
p all_doctors

# READ by ID - Procura no banco o registro de acordo com ID
george = Doctor.find(2)
# p george

# CREATE - Cria um novo registro no banco através dos respectivos seus atributos
house = Doctor.new(name: "Gregory House", age: 43, specialty: "General Clinic" )
house.save

# UPDATE - Atualiza no banco de dados, a instância cujo ID seja existente no banco
attributes = Doctor.find(1)
dolittle = Doctor.new(attributes)
dolittle.name = "Sigmund Freud"
dolittle.age = 70
dolittle.specialty = "Psicology"
dolittle.update

# DELETE - Remove o registro do banco que contém determinado ID
Doctor.destroy(dolittle.id)

