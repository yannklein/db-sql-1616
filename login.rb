require "sqlite3"
DB = SQLite3::Database.new("data/exploitable.sqlite")

def login(username, password)
  query = <<~SQL
    SELECT * 
    FROM users
    WHERE username = ? AND password = ?
  SQL
  puts query + "\n"
  results = DB.execute(query, username, password)
  if results.any?
    puts "Welcome #{username}!\n\n"
  else
    puts "Username or password incorrect...\n\n"
  end
end

login("john", "passw0rd") # works
login("john", "iforgot") # wrong password
login("john", "' OR true --")