# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
taryn = User.create(name: "taryn", username: "tnhubbar", password: "Ricardo")
speed = Routine.create(name: "speed", description: "This is fast")
cardio = Category.create(name: "Cardio")
Category.create(name: "Strength Training")
Category.create(name: "Yoga")
Category.create(name: "Stretches")
Category.create(name: "Abs")
Category.create(name: "High Intensity")


