require 'sqlite3'
DB = SQLite3::Database.new("data/patients_doctors.sqlite")

specialty = 'Chemistry'

rows = DB.execute("SELECT * FROM doctors WHERE specialty = ? ", specialty)

p rows