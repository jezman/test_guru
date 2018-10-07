# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: :embedded }, { title: :backend }])

tests = Test.create(
  [{ title: 'C/C++', level: 3, category_id: categories[0].id },
   { title: 'Golang', level: 2, category_id: categories[1].id },
   { title: 'Ruby', level: 1, category_id: categories[1].id },
   { title: 'Python', level: 2, category_id: categories[1].id},
   { title: 'STM32', level: 3, category_id: categories[0].id }]
)

questions = Question.create(
  [{ body: 'C/C++ question #1', test_id: tests[0].id },
   { body: 'Golang question #1', test_id: tests[1].id },
   { body: 'Ruby question #1', test_id: tests[2].id },
   { body: 'Python question #1', test_id: tests[3].id },
   { body: 'STM32 question #1', test_id: tests[4].id }]
)

Answer.create(
  [{ body: 'Answer 1q1', question_id: questions[0].id, correct: false },
   { body: 'Answer 2q1', question_id: questions[0].id, correct: true },
   { body: 'Answer 1q2', question_id: questions[1].id, correct: false },
   { body: 'Answer 2q2', question_id: questions[1].id, correct: true },
   { body: 'Answer 1q3', question_id: questions[2].id, correct: false },
   { body: 'Answer 2q3', question_id: questions[2].id, correct: true },
   { body: 'Answer 1q4', question_id: questions[3].id, correct: false },
   { body: 'Answer 2q4', question_id: questions[3].id, correct: true },
   { body: 'Answer 1q5', question_id: questions[4].id, correct: false },
   { body: 'Answer 2q5', question_id: questions[4].id, correct: true }]
)

users = User.create(
  [{ email: 'first@supermail.com', username: :firstuser },
   { email: 'second@supermail.com', username: :seconduser }]
)

TestPassing.create(
  [{ user: users[0], test: tests[0] },
   { user: users[0], test: tests[1] },
   { user: users[1], test: tests[2] },
   { user: users[1], test: tests[3] }]
)
