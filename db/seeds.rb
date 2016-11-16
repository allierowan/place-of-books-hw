# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

book = Book.create(name: "The Name of the Wind", author: "Patrick Rothfuss", description: "This is a really good book", isbn_number: "123445")
book2 = Book.create(name: "Lolita", author: "Vladimir Nabokov", description: "Humbert does his thing", isbn_number: "234234")

10.times do
  Book.create(name: FFaker::Book.title, description: FFaker::Book.description, isbn_number: FFaker::Book.isbn, author: FFaker::Book.author)
end

book.reservations.create(name: FFaker::Name.name, due_date: Date.tomorrow, overdue: false)
book2.reservations.create(name: FFaker::Name.name, due_date: Date.tomorrow, overdue: false)
book.reservations.create(name: FFaker::Name.name, due_date: Date.tomorrow, overdue: false)
book2.reservations.create(name: FFaker::Name.name, due_date: Date.tomorrow, overdue: false)
