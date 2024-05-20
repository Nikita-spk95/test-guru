# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

users = User.create!([name: 'User1', email: 'test1@test.com'])

categories = Category.create!([
  { title: 'Ruby' },
  { title: 'JS' }
])

tests = Test.create!([
  { title: 'Ruby beginner', level: 1, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Ruby advanced', level: 2, category_id: categories[0].id, author_id: users[0].id },
  { title: 'JS beginner', level: 1, category_id: categories[1].id, author_id: users[0].id },
  { title: 'JS advanced', level: 2, category_id: categories[1].id, author_id: users[0].id }
])

questions = Question.create!([
  { body: 'What are objects in Ruby?', test_id: tests[0].id },
  { body: "What's difference between 'puts' 'print'?", test_id: tests[0].id },
  { body: 'What is the difference between calling super and calling super()?', test_id: tests[1].id },
  { body: 'What is React JS?', test_id: tests[2].id },
  { body: 'Where you can use AWAIT operator?', test_id: tests[3].id }
])

Answer.create!([
  { body: 'Everything in Ruby is an object.', correct: true, question_id: questions[0].id },
  { body: 'There are no objects in ruby.', correct: false, question_id: questions[0].id },
  { body: 'Only class instances.', correct: false, question_id: questions[0].id },
  { body: 'Only strings.', correct: false, question_id: questions[0].id },

  { body: 'Same functions.', correct: false, question_id: questions[1].id },
  { body: 'PUTS and PRINT same as P function', correct: false, question_id: questions[1].id },
  { body: 'PUTS add a new line at the end, PRINT same line', correct: true, question_id: questions[1].id },
  { body: 'PRINT add a new line at the end, PUTS same line', correct: false, question_id: questions[1].id },

  { body: 'No difference', correct: false, question_id: questions[2].id },
  { body: 'SUPER() - no arguments, SUPER - send all arguments passed to the function to parent.', correct: true, question_id: questions[2].id },
  { body: 'SUPER - no arguments, SUPER() - send all arguments passed to the function to parent.', correct: false, question_id: questions[2].id },
  { body: 'SUPER and SUPER() no arguments', correct: false, question_id: questions[2].id },

  { body: 'Game framework', correct: false, question_id: questions[3].id },
  { body: 'Backend library', correct: false, question_id: questions[3].id },
  { body: 'Library for web and native user interfaces.', correct: true, question_id: questions[3].id },
  { body: 'Machine learning framefork', correct: false, question_id: questions[3].id },

  { body: 'An async function or at the top level of module.z', correct: true, question_id: questions[4].id },
  { body: 'Just an async function', correct: false, question_id: questions[4].id },
  { body: 'Just at the top level of module.z', correct: false, question_id: questions[4].id },
  { body: 'Same as WARN()', correct: false, question_id: questions[4].id }
])