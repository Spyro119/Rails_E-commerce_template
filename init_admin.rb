
# puts "To create your first admin account, please answer these questions. \n 
#  Type your username"

#  username = gets.chomp.to_s

#  puts "Type your password:"
#  password = gets.chomp.to_s

#  puts "type your email :"
#  email = gets.chomp.to_s

 User.create(id:1, is_admin: true, username: username, password: password, email: email)
# User.create!(is_admin: true, username: "admin", password: "password" , email: "email@hotmail.com", first_name: "John", last_name: "Doe")

