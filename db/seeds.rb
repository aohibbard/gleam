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

Body.create(name: "Body")
Body.create(name: "Eyes")
Body.create(name: "Scalp")
Body.create(name: "Face")
Body.create(name: "Lips")
Body.create(name: "Nails")
Body.create(name: "Feet")
Body.create(name: "Oral")
Body.create(name: "Hindquarters")
Body.create(name: "Nose")

Category.create(name: "Serum")
Category.create(name: "Oil")
Category.create(name: "Lip Treatment")
Category.create(name: "Exfoliant")
Category.create(name: "Moisturizer")
Category.create(name: "Toner")
Category.create(name: "Fragrance")
Category.create(name: "Applicator")
Category.create(name: "Cleanser")
Category.create(name: "Peel")
Category.create(name: "Supplement")
Category.create(name: "Mask")
Category.create(name: "Wipe")
