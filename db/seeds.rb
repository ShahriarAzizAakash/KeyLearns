User.destroy_all
Course.destroy_all

aakash = User.create!(username: 'aakash', email: 'aakash@gmail.com', password: 'password')
anwar = User.create!(username: 'anwar', email: 'anwar@gmail.com', password: 'password')

puts "#{User.count} users created!"

Course.create!(user: aakash, title: 'Ruby on Rails Beginner Course', description: 'This is a beginners guide for ruby on rails. In this course I assume that you have basics of ruby. After this course you will be able to create new rails applications and do basic user authentication.', price: '0')
Course.create!(user: anwar, title: 'React Beginner Course', description: 'This is a beginners guide for react. In this course I assume that you have basics of javascript. After this course you will be able to create front-end react applications with rails back-end and do basic user authentication.', price: '0')

puts "#{Course.count} courses created!"