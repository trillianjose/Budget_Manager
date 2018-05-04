# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
t = TransactionType.create([{name: 'Purchase'}, {name: 'Withdrawal' }, {name: 'Transfer'}, {name: 'Payment'}])
c = Category.create([{name: 'Restaurants' }, { name: 'Grocery' }, { name: 'Car' }, { name: 'Services' }, { name: 'Home' }, { name: 'Education' }, { name: 'Fun' }, { name: 'Travel' }])

1.times do |u|
  u = User.create(email: Faker::Internet.email,password: Faker::Internet.password)
  600.times do |i|
    Expense.create(user_id: u.id, amount: Faker::Number.number(8), concept: Faker::LeagueOfLegends.quote, date: Faker::Date.between(10.month.ago, Date.today), category: c.sample, transaction_type: t.sample)
   end
end
