# User.destroy_all
 Category.destroy_all
# Biddr.destroy_all
# Item.destroy_all
Tag.destroy_all

PASSWORD = 'pass123'

categories = Category.create([
  {name: 'Baby Items'},
  {name: 'Books'},
  {name: 'Electronics & Entertainment'},
  {name: 'Beaty'},
  {name: 'Home'},
  {name: 'Sports & Fitness'},
	{name: 'Toys'},
  {name: 'Vehicles'},
	{name: 'Clothes'},
  {name: 'Shoes'},
  {name: 'Purse, Jewelry & Accessories'},
	{name: 'Other'}
])

users = User.create([
  {first_name: 'Jon', last_name: 'Snow', email: 'js@winterfell.gov', password: PASSWORD},
  {first_name: 'Daenerys', last_name: 'Targaryan', email: 'daeny@dragon.io', password: PASSWORD},
  {first_name: 'Cersei', last_name: 'Lannister', email: 'cs@iron.throne', password: PASSWORD}
])

10.times do
  Item.create title: Faker::Hacker.say_something_smart,
                  body:  Faker::Hipster.paragraph,
                  view_count: rand(100),
                  user: users.sample,
                  category: categories.sample
end

items = Item.all

items.each do |q|
  rand(1..5).times do
    Biddr.create(bid: Faker::Number.number(4), item: q)
  end
end

10.times do
  Tag.create name: Faker::Hipster.word
end

puts Cowsay.say "Created #{Item.all.count} items", :cow
puts Cowsay.say "Created #{Biddr.all.count} biddrs! ", :cow
