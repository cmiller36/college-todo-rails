# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Users ##
User.create(
  username: 'Sparklecat',
  email: "sparkle@email.com",
  password: "test123",
  password_confirmation: "test123",
)

User.create(
  username: "dalecooper",
  email: "thecoop@email.com",
  password: 'password',
  password_confirmation: 'password'
)
User.create(
  username: "laurapalmer",
  email: "lpalmer@email.com",
  password: 'password',
  password_confirmation: 'password'
)
User.create(
  username: "loglady",
  email: "theloglady@email.com",
  password: 'password',
  password_confirmation: 'password'
)
User.create(
  username: "GobBluth",
  email: "gob@email.com",
  password: 'password',
  password_confirmation: 'password'
)
User.create(
  username: "Tobias",
  email: "analrapist@email.com",
  password: 'password',
  password_confirmation: 'password'
)
