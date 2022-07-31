# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Users
jack = User.create(username:"JackBarsky", email:"user1@exampleexample.com", password:"123456", id:1000)
micheal = User.create(username:"Michael", email:"user2@exampleexample.com", password:"123456", id:1001)
alex = User.create(username:"Alex", email:"user3@exampleexample.com", password:"123456", id:1002)
daniel = User.create(username:"Daniel", email:"user4@exampleexample.com", password:"123456", id:1003)

# Friendships
Friendship.create(status: true, user:jack, friend:micheal)
Friendship.create(status: true, user:jack, friend:alex)
Friendship.create(status: true, user:jack, friend:daniel)
Friendship.create(status: true, user:micheal, friend:alex)
Friendship.create(status: true, user:micheal, friend:daniel)
Friendship.create(status: true, user:alex, friend:jack)

# User Posts
p1 = Post.create(user: jack, body:"Best social media ever")
p2 = Post.create(user: jack,body:"Hahaha last night was a movie!!!")
p3 = Post.create(user: jack,body:"I didn't like using a headset it was uncomfortable plus you look like a complete twit who works at a call center.")
p4 = Post.create(user: alex,body:"Joe waited for the train.")
p5 = Post.create(user: alex,body:"Today is so hot!")
p6 = Post.create(user: micheal,body:"We are going out tonight")
p7 = Post.create(user: micheal,body:"Yesssss")
p8 = Post.create(user: micheal,body:"GOALLLLL")
p9 = Post.create(user: daniel,body:"Ruby and Rails is da best.")
p10 = Post.create(user: daniel,body:"Ruby and Rails is da best of best.")

# Likes
PostLiking.create(post: p1,user: jack)
PostLiking.create(post: p4,user: jack)
PostLiking.create(post: p6,user: jack)
PostLiking.create(post: p9,user: jack)
PostLiking.create(post: p1,user: micheal)
PostLiking.create(post: p4,user: micheal)
PostLiking.create(post: p6,user: micheal)
PostLiking.create(post: p9,user: micheal)
PostLiking.create(post: p1,user: daniel)
PostLiking.create(post: p4,user: daniel)
PostLiking.create(post: p6,user: alex)
PostLiking.create(post: p9,user: alex)
