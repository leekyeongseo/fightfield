# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create(email:"nemo513@naver.com", password:'ares9617', password_confirmation:'ares9617')
user_2 = User.create(email:"kslee@vonvon.me", password:'ares9617',password_confirmation:'ares9617')
user_3 = User.create(email:"nemo00513@gmail.com",password:'ares9617',password_confirmation:'ares9617')
