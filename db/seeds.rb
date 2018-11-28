# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create([{ title: 'Ruby' },
                              { title: 'Go' },
                              { title: 'HTML' }])

users = User.create([{ username: 'Bob', email: 'bob@gmail.com', password: '123' },
                    { username: 'Alice', email: 'alice@gmail.com', password: '345' },
                    { username: 'Dio', email: 'dio@gmail.com', password: '567' }])

tests = Test.create([{ title: 'Ruby Basic', category: categories[0], author: users[0] },
                    { title: 'Ruby Intermediate', level: 1, category: categories[0], author: users[0] },
                    { title: 'Ruby Advanced', level: 2, category: categories[0], author: users[0] },
                    { title: 'Go Basic', category: categories[1], author: users[0] },
                    { title: 'Go Intermediate', level: 1, category: categories[1], author: users[0] },
                    { title: 'Go Advanced', level: 2, category: categories[1], author: users[0] },
                    { title: 'HTML Basic', category: categories[2], author: users[0] },
                    { title: 'HTML Intermediate', level: 1, category: categories[2], author: users[0] },
                    { title: 'HTML Advanced', level: 2, category: categories[2], author: users[0] }])

questions = Question.create([{ body: 'Ruby Basic question 1', test: tests[0] },
                            { body: 'Ruby Basic question 2', test: tests[0] },
                            { body: 'Ruby Basic question 3', test: tests[0] },
                            { body: 'Ruby Intermediate question', test: tests[1] },
                            { body: 'Ruby Advanced question', test: tests[2] },
                            { body: 'Go Basic question', test: tests[3] },
                            { body: 'Go Intermediate question', test: tests[4] },
                            { body: 'Go Advanced question', test: tests[5] },
                            { body: 'HTML Basic question', test: tests[6] },
                            { body: 'HTML Intermediate question', test: tests[7] },
                            { body: 'HTML Advanced question', test: tests[8] }])

answers = Answer.create([{ body: 'Ruby Basic answer 1-1', question: questions[0], correct: true },
                        { body: 'Ruby Basic answer 1-2', question: questions[0] },
                        { body: 'Ruby Basic answer 1-3', question: questions[0] },
                        { body: 'Ruby Basic answer 1-4', question: questions[0] },
                        { body: 'Ruby Basic answer 2-1', question: questions[1], correct: true },
                        { body: 'Ruby Basic answer 2-2', question: questions[1] },
                        { body: 'Ruby Basic answer 2-3', question: questions[1] },
                        { body: 'Ruby Basic answer 2-4', question: questions[1] },
                        { body: 'Ruby Basic answer 3-1', question: questions[2], correct: true },
                        { body: 'Ruby Basic answer 3-2', question: questions[2] },
                        { body: 'Ruby Basic answer 3-3', question: questions[2] },
                        { body: 'Ruby Basic answer 3-4', question: questions[2] },
                        { body: 'Ruby Intermediate answer', question: questions[3] },
                        { body: 'Ruby Advanced answer', question: questions[4] },
                        { body: 'Go Basic answer', question: questions[5] },
                        { body: 'Go Intermediate answer', question: questions[6] },
                        { body: 'Go Advanced answer', question: questions[7] },
                        { body: 'HTML Basic answer', question: questions[8] },
                        { body: 'HTML Intermediate answer', question: questions[9] },
                        { body: 'HTML Advanced answer', question: questions[10] }])
