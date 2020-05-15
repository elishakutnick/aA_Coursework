# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ArtworkShare.destroy_all
Artwork.destroy_all

user1 = User.create!(username: 'Bob')
user2 = User.create!(username: 'Alex')
user3 = User.create!(username: 'Sally')
artwork1 = Artwork.create!(title: 'Mona Lisa', image_url: 'www.google.com', artist_id: user1.id)
artwork2 = Artwork.create!(title: 'The Creation of Adam', image_url: 'www.googleee.com', artist_id: user2.id)
artwork3 = Artwork.create!(title: 'Happy Times', image_url: 'www.go00ogle.com', artist_id: user3.id)
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user2.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user1.id)
ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user3.id)
comment1 = Comment.create!(body: 'This is a great painting', artwork_id: artwork1.id, user_id: user1.id)