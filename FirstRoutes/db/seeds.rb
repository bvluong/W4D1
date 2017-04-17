# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
user1 = User.create(user_name: 'bryant')
user2 = User.create(user_name: 'brady')

Artwork.destroy_all
artwork1 = Artwork.create(title: 'Art', image_url: 'www.art.com', artist_id: user1.id)
artwork1 = Artwork.create(title: 'Art 2', image_url: 'www.art.com/2', artist_id: user2.id)

ArtworkShare.destroy_all
artshare1 = ArtworkShare.create(viewer_id: user2.id, artwork_id: artwork1.id)


# user1 = User.create(name: "bryant", email: "bryant@bryant.bryant")
# user2 = User.create(name: "brady", email: "brady@brady.brady")
