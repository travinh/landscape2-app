# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Team.create(name: "A")
Team.create(name: "B")
Team.create(name: "C")

User.create(name: "vinh", email: "vinh@test.com", password: "123456")
User.create(name: "david", email: "david@test.com", password: "123456")

Landscape.create(team_id: 1, user_id: 1,  address: "123 abc", area: 20)
Landscape.create(team_id: 2,user_id: 2, address: "567 colfax", area: 30)
Landscape.create(team_id: 3, user_id: 1,address: "11 federal", area: 40)