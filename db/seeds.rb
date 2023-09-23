# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(
  email: 'netis_group@gmail.com',
  password: 'Netis_12345',
  last_name: 'Nizar',
  first_name: 'belmahfoud',
  phone: '065367489',
  nationality: "Morocco",
  cin: "j2902",
  gender: "male",
  birthdate: "1992-02-02"
)


Role.create(
  user_id: 1,
  name: 1
)
