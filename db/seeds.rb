# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

1.upto(15) do |i|
  user = User.create!(email: "user#{i}@user.com", password: "password")
  user.tasks.create!(name: "Task for user number#{i}", content: "Tasks tasks")
end
