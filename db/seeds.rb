# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Name: Gwenyth Paltrow, Username: guineapig, email: gp@goop.com, password: uncoupling
# Name: Naomi Campbell, u/n: itsnaomi, email: naomi@test.com, password: myface
# Name: Cate Blanchett, u/n: meredithlogue, email: cate@email.au, p/w ilovetherese 
# Name: Spam Troll, u/n: trollio, emial: troll@troll.info, p/w 123123


# User.create(name: 'Gwenyth Paltrow', username: 'guineapig', email: 'gp@goo')

# Category.create(name: "Serum")
# Category.create(name: "Oil")
# Category.create(name: "Lip Treatment")
# Category.create(name: "Exfoliant")
# Category.create(name: "Moisturizer")
# Category.create(name: "Toner")
# Category.create(name: "Fragrance")
# Category.create(name: "Applicator")
# Category.create(name: "Cleanser")
# Category.create(name: "Peel")
# Category.create(name: "Supplement")
# Category.create(name: "Mask")
# Category.create(name: "Wipe")


Manufacturer.create(name: "SKII", year_est: rand(1900..2020))
Manufacturer.create(name: "Kiehl's", year_est: rand(1900..2020))
Manufacturer.create(name: "Biossance", year_est: rand(1900..2020))
Manufacturer.create(name: "The Ordinary", year_est: rand(1900..2020))
Manufacturer.create(name: "Pfizer", year_est: rand(1900..2020))
Manufacturer.create(name: "Cerave", year_est: rand(1900..2020))
# Manufacturer Olay, id: 1

Product.create(name: "Moisturizer", manufacturer_id: rand(1..6), price: Faker::Number.decimal(l_digits: 2), category_id: rand(1..13))
Product.create(name: "Oil of Olay", manufacturer_id: 1, price: Faker::Number.decimal(l_digits: 2), category_id: rand(1..13))
Product.create(name: "Hair Serum", manufacturer_id: rand(1..6), price: Faker::Number.decimal(l_digits: 2), category_id: rand(1..13))
Product.create(name: "SPF AMAZING!", manufacturer_id: rand(1..6), price: Faker::Number.decimal(l_digits: 2), category_id: rand(1..13))
Product.create(name: "Clay Masque", manufacturer_id: rand(1..6), price: Faker::Number.decimal(l_digits: 2), category_id: rand(1..13))
Product.create(name: "Vitamin C Serum", manufacturer_id: rand(1..6), price: Faker::Number.decimal(l_digits: 2), category_id: rand(1..13))

