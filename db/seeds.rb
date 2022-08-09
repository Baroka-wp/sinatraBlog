require 'faker'

# --- Create Users ---
# first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
# third_user = User.create(name: 'Path', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from France.')


# --- Create Posts ---
# User.all.each do |user|
#     2.times do |post|
#         Post.create(
#             title: Faker::Lorem.sentence(word_count: 3), 
#             text: Faker::Quote.famous_last_words, user_id: user.id
#         )
#     end
# end


# --- Create Comments ---
# Post.all.each do |post|
#     User.all.each do |user|
#         if post.id.even?
#             2.times do |comment|
#                 Comment.create(
#                     text: Faker::Quote.famous_last_words, post_id: post.id, user_id: user.id
#                 )
#             end
#         end
#     end
# end

# --- Query ---
# Count comments on post where id equals 10

post = Post.find_by(id: 10)
post.comments.count

# Count all posts of user with id 3
user = User.find_by(id: 3)
user.posts.count

# delete all comments where user_id is odd
Comment.where("user_id%2 != 0").destroy_all

# update

url = 'https://unsplash.com/photos/jJlb9KW7SQQ'
user = User.find_by(id: 3).update(photo: url)