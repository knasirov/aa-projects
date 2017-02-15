# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all
Cat.create!(name: "Penguin", sex: "F", birth_date: Date.new(2001, 2, 3),
          color: "black", description: "Friendly, plays well with dogs")
Cat.create!(name: "Elephant", sex: "M", birth_date: Date.new(2015, 8, 3),
          color: "brown", description: "Has a ticklish spot on her belly, do not touch it, he will bite")
Cat.create!(name: "Meerkat", sex: "M", birth_date: Date.new(1999, 2, 5),
          color: "ginger", description: "Reclusive and pensive. Quite thoughtful seeming")
Cat.create!(name: "Dog", sex: "F", birth_date: Date.new(2007, 5, 23),
          color: "hairless", description: "Cuddly")
Cat.create!(name: "Parrot", sex: "M", birth_date: Date.new(2009, 1, 2),
          color: "ginger", description: "Stereotypical cat type-of cat")
Cat.create!(name: "Blowfish", sex: "X", birth_date: Date.new(2014, 11, 29),
          color: "white", description: "Surprisingly good swimmer (for a cat)")

CatCuddleRequest.destroy_all
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Penguin").id, start_date: Date.new(2017, 2, 15), end_date: Date.new(2017, 2, 17), status: "APPROVED")
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Penguin").id, start_date: Date.new(2017, 3, 1), end_date: Date.new(2017, 3, 17))
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Elephant").id, start_date: Date.new(2017, 2, 15), end_date: Date.new(2017, 2, 17), status: "APPROVED")
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Elephant").id, start_date: Date.new(2017, 2, 20), end_date: Date.new(2017, 2, 22), status: "APPROVED")
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Meerkat").id, start_date: Date.new(2017, 4, 15), end_date: Date.new(2017, 4, 16))
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Parrot").id, start_date: Date.new(2017, 2, 15), end_date: Date.new(2017, 2, 17))
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Parrot").id, start_date: Date.new(2017, 2, 17), end_date: Date.new(2017, 2, 18))
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Parrot").id, start_date: Date.new(2017, 2, 18), end_date: Date.new(2017, 2, 20), status: "DENIED")
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Blowfish").id, start_date: Date.new(2017, 3, 11), end_date: Date.new(2017, 3, 12), status: "DENIED")
CatCuddleRequest.create!(cat_id: Cat.find_by(name: "Blowfish").id, start_date: Date.new(2017, 3, 15), end_date: Date.new(2017, 3, 17))
