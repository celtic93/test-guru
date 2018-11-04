# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Test.create([{ title: 'Ruby Basic', category_id: 1 },
             { title: 'Ruby Intermediate', level: 1, category_id: 1 },
             { title: 'Ruby Advanced', level: 2, category_id: 1 },
             { title: 'Go Basic', category_id: 2 },
             { title: 'Go Intermediate', level: 1, category_id: 2 },
             { title: 'Go Advanced', level: 2, category_id: 2 },
             { title: 'HTML Basic', category_id: 3 },
             { title: 'HTML Intermediate', level: 1, category_id: 3 },
             { title: 'HTML Advanced', level: 2, category_id: 3 }])

Category.create([{ title: 'Ruby' },
                 { title: 'Go' },
                 { title: 'HTML' }])

Question.create([{ body: 'Ruby Basic question', test_id: 1 },
                 { body: 'Ruby Intermediate question', test_id: 2 },
                 { body: 'Ruby Advanced question', test_id: 3 },
                 { body: 'Go Basic question', test_id: 4 },
                 { body: 'Go Intermediate question', test_id: 5 },
                 { body: 'Go Advanced question', test_id: 6 },
                 { body: 'HTML Basic question', test_id: 7 },
                 { body: 'HTML Intermediate question', test_id: 8 },
                 { body: 'HTML Advanced question', test_id: 9 }])

Answer.create([{ body: 'Ruby Basic answer', question_id: 1 },
               { body: 'Ruby Intermediate answer', question_id: 2 },
               { body: 'Ruby Advanced answer', question_id: 3 },
               { body: 'Go Basic answer', question_id: 4 },
               { body: 'Go Intermediate answer', question_id: 5 },
               { body: 'Go Advanced answer', question_id: 6 },
               { body: 'HTML Basic answer', question_id: 7 },
               { body: 'HTML Intermediate answer', question_id: 8 },
               { body: 'HTML Advanced answer', question_id: 9 }])

User.create([{ username: 'Bob', email: 'bob@gmail.com' },
             { username: 'Alice', email: 'alice@gmail.com' },
             { username: 'Dio', email: 'dio@gmail.com' }])

StartedTest.create([{user_id: 1, test_id: 2, test_started: true},
                    {user_id: 1, test_id: 5, test_passed: true},
                    {user_id: 1, test_id: 7, test_started: true},
                    {user_id: 2, test_id: 1, test_passed: true},
                    {user_id: 2, test_id: 6, test_started: true},
                    {user_id: 2, test_id: 8, test_passed: true},
                    {user_id: 3, test_id: 3, test_started: true},
                    {user_id: 3, test_id: 4, test_passed: true},
                    {user_id: 3, test_id: 9, test_started: true}])
