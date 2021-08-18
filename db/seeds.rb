# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

number = 0
3.times do |n|
  user = User.new(
    name: "test_user_name#{n}",
    email: "test#{n}@example.com",
    password: "password"
  )
  5.times do |n|
    number += 1
    user.words.build(
      word: "テスト_#{n}",
      memo: "テストだよ_#{number}"
    )
  end

  user.save!
end
