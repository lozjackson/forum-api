# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# reset database with
# rake db:migrate:reset
#

if Rails.env.production?
  admin = User.create(username: "admin", name: "Administrator", password: 'adminpassword')
  admin.add_role :admin
end

if Rails.env.development?
  admin = User.create(username: "admin", name: "Administrator", password: 'adminpassword')
  admin.add_role :admin

  author1 = User.create(username: "amy", name: "Amy", password: 'password')
  author2 = User.create(username: "loz", name: "Loz Jackson", password: '1234')
  author3 = User.create(username: "daniel", name: "Daniel Duck", password: 'password')
  author4 = User.create(username: "amanda", name: "Amanda Djidjinski", password: 'password')
  author5 = User.create(username: "zoe", name: "Zoe Zack", password: 'password')
  author6 = User.create(username: "bill", name: "Bill Burray", password: 'password')
  author7 = User.create(username: "charlie", name: "Charlie Chuck", password: 'password')

  topic1 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic2 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic3 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic4 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic5 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic6 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic7 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic8 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic9 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic10 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic11 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic12 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic13 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic14 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic15 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic16 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic17 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic18 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic19 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic20 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic21 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic22 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic23 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic24 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic25 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic26 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic27 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic28 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic29 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic30 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic31 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic32 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic33 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic34 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic35 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic36 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic37 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic38 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic39 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic40 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic41 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic42 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic43 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic44 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic45 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic46 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic47 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic48 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic49 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic50 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic51 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic52 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic53 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic54 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic55 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic56 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic57 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')
  topic58 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
  topic59 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
  topic60 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')



  post1 = Post.create(body: "foo", user: author3, topic: topic1)
  post2 = Post.create(body: "bar", user: author7, topic: topic2)
end
