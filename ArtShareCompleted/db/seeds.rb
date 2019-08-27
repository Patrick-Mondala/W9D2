# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username: 'Bob')
User.create(username: 'Frank')
User.create(username: 'Mark')
User.create(username: 'Test')
User.create(username: 'Random')

Artwork.create(title: 'TestPainting', image_url: 'www.google.com/test.png', artist_id: 1)
Artwork.create(title: 'Mona Lisa', image_url: 'www.google.com/error.png', artist_id: 2)

ArtworkShare.create(artwork_id: 2, viewer_id: 1)
ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 1, viewer_id: 3)
ArtworkShare.create(artwork_id: 2, viewer_id: 3)
ArtworkShare.create(artwork_id: 1, viewer_id: 5)
ArtworkShare.create(artwork_id: 2, viewer_id: 5)

Comment.create(artwork_id: 2, author_id: 1, body: "zdsfsa")
Comment.create(artwork_id: 1, author_id: 2, body: "asdfnjaksdbfnkl")
Comment.create(artwork_id: 2, author_id: 3, body: "ijkonklnkl")
Comment.create(artwork_id: 1, author_id: 5, body: "qdfsfadsf")
Comment.create(artwork_id: 2, author_id: 3, body: "csdafaa")
Comment.create(artwork_id: 1, author_id: 4, body: "blksjadflk")



