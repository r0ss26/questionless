# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

15.times do |count|
  new_user = User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )

  puts "User no.#{count} created"

  [*(1..3)].sample.times do |count2|
    new_question = new_user.questions.create(
      title: Faker::Lorem.sentence + ' ?'
    )

    puts "Question no.#{count2} created"
  end
end

# Question.all.each do |question|
#   User.all.each do |_user|
#     count = 0
#     [true, false].sample

#     if true
#       question.answers.create(
#         answer: Faker::Lorem.paragraphs(number: 5).join(' ')
#       )
#       count += 1
#     end

#     puts "Answer no.#{count} created"
#     # question.answers.create(Faker::Lorem.paragraph.join(' ').merge(user_id: user.id))
#   end
# end
