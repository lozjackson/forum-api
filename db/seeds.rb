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

author1 = User.create(username: "loz", name: "Loz Jackson")
author2 = User.create(username: "robert", name: "Roberta Rock")
author3 = User.create(username: "daniel", name: "Daniel Duck")
author4 = User.create(username: "amanda", name: "Amanda Djidjinski")
author5 = User.create(username: "zoe", name: "Zoe Zack")
author6 = User.create(username: "bill", name: "Bill Burray")
author7 = User.create(username: "charlie", name: "Charlie Chuck")

topic1 = Topic.create(title: "The Great Escape", user: author7, body: 'test')
topic2 = Topic.create(title: "Saving Myself", user: author6, body: 'test')
topic3 = Topic.create(title: "Sound Engineering", user: author1, body: 'is fun')

post1 = Post.create(body: "foo", user: author3, topic: topic1)
post2 = Post.create(body: "bar", user: author7, topic: topic2)
