# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "admin@admin.com",
  password: "adminpassword",
  password_confirmation: "adminpassword",
  name: "Admin User",
  roles: "site_admin"
)

puts "Admin User Created"

User.create!(
  email: "testuser@testuser.com",
  password: "userpassword",
  password_confirmation: "userpassword",
  name: "User"
)

puts "Normal User Created"

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}"
  )
end

puts "3 Topics created"

10.times do |blog|
  Blog.create!(
    title: "My blog post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
       sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        Ut enim ad minim veniam, quis nostrud exercitation ullamco 
        laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
        dolor in reprehenderit in voluptate velit esse cillum dolore eu
        fugiat nulla pariatur. Excepteur sint occaecat cupidatat non 
        proident, sunt in culpa qui officia deserunt mollit anim id est 
        laborum.",
    topic_id: Topic.last.id,
  )
end

5.times do |skill|
  Skill.create!(
    title: "Skill #{skill}",
    percent_utilized: 15,
  )
end

8.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Sit amet consectetur adipiscing elit pellentesque 
        habitant morbi tristique senectus. Cursus turpis massa tincidunt 
        dui ut ornare. Lectus magna fringilla urna porttitor rhoncus. 
        Sed elementum tempus egestas sed sed risus pretium. Phasellus 
        faucibus scelerisque eleifend donec pretium vulputate sapien nec 
        sagittis. A arcu cursus vitae congue mauris rhoncus aenean vel.",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200",
  )
end

1.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title: #{portfolio}",
    subtitle: "Angular",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Sit amet consectetur adipiscing elit pellentesque 
        habitant morbi tristique senectus. Cursus turpis massa tincidunt 
        dui ut ornare. Lectus magna fringilla urna porttitor rhoncus. 
        Sed elementum tempus egestas sed sed risus pretium. Phasellus 
        faucibus scelerisque eleifend donec pretium vulputate sapien nec 
        sagittis. A arcu cursus vitae congue mauris rhoncus aenean vel.",
    main_image: "https://via.placeholder.com/600x400",
    thumb_image: "https://via.placeholder.com/350x200",
  )
end

3.times do |technology|
  Technology.create!(name: "Technology #{technology}",
                     portfolio_id: Portfolio.last.id)
end

puts "Created 3 Technologies"
