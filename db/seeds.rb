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

# post = Post.find_by(id: 10)
# post.comments.count

# # Count all posts of user with id 3
# user = User.find_by(id: 3)
# user.posts.count

# # delete all comments where user_id is odd
# Comment.where("user_id%2 != 0").destroy_all

# # update

# url = 'https://unsplash.com/photos/jJlb9KW7SQQ'
# user = User.find_by(id: 3).update(photo: url)

# images = [
#     'https://images.unsplash.com/photo-1660503427782-f9c627e7066e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
#     'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1587&q=80',
#     'https://images.unsplash.com/photo-1660536754523-13d686a48178?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=857&q=80'
# ]

# i = 0
# User.all.each do |user|
#     user.update(photo: images[i])
#     i += 1
# end

user = User.find_by(id: 3)
user.posts.create(
    title: Faker::Lorem.sentence(word_count: 3), 
    text: Faker::Quote.famous_last_words, user_id: user.id
)