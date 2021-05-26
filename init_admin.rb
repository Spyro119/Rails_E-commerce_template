
# puts "To create your first admin account, please answer these questions. \n 
#  Type your username"

#  username = gets.chomp.to_s

#  puts "Type your password:"
#  password = gets.chomp.to_s

#  puts "type your email :"
#  email = gets.chomp.to_s

 User.create(id:1, is_admin: true, username: username, password: password, email: email)
# User.create!(is_admin: true, username: "test", password: "123456" , email: "email@test.com", first_name: "John", last_name: "Doe", :confirmed_at: Time.now )

