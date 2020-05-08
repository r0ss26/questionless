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
  
  new_user.update(
    name: Faker::Name.name_with_middle,
    description: Faker::Lorem.sentence
  )

  puts "User no.#{count} created"

  [*(1..3)].sample.times do |count2|
    tags = []
    (0..rand(5)).each do |_i|
      tags.push(Faker::Verb.past)
    end
    new_question = new_user.questions.create(
      title: Faker::Lorem.sentence.chop + '?',
      tag_list: tags
    )

    puts "Question no.#{count2} created"
  end
end

# questions = []
# [*(0..Question.all.count)].sample.times do
#   questions.push(Question.all.sample)
# end
# questions = questions.uniq

count = 0
count2 = 0
Question.all.each do |question|
  count2 += 1
  users = []
  [*(0..7)].sample.times do
    users.push(User.all.sample)
  end
  users = users.uniq

  users.each do |user|
    question.answers.create(
      answer: Faker::Lorem.paragraphs(number: 5).join(' '),
      user_id: user.id
    )
    count += 1
    puts "Question no.#{count2} - answer no.#{count} created"
  end
end
