# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

user_1 = User.create({username:"KinKin", email:"odrunia.km@gmail.com", password:"password"})

Todo.destroy_all
todo_1 = Todo.create({user_id: user_1.id, title:"Go to Target", description: "Buy Nasal Spray", done:false})

Quote.destroy_all

quote_1 = Quote.create({user_id: user_1.id, body:"You are here to enjoy life. You are not here to suffer over your drama or your personal importance. It’s not you, it doesn’t belong to your presence. You are here to be a dreamer, to be an artist, to be a seer. But you cannot be a seer when you only have eyes to see your own story, your own wounds, your own victimization. Once you become a seer, you’ll see life through Divine eyes", author:"Don Jose Ruiz"})