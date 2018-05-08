# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  User.destroy_all

  hagrid = User.create!(username: 'Rubeus Hagrid')
  harry = User.create!(username: 'Harry Potter')
  hermione = User.create!(username: 'Hermione Granger')
  dumbledore = User.create!(username: "Albus Dumbledore")

  Artwork.destroy_all
  chirp1 = Artwork.create!(artist_id: hagrid.id, title: "You're a wizard", img_url: "Harry.com")

  chirp2 = Artwork.create!(artist_id: harry.id, title: "I solemnly swear I am up to no", img_url: "good.com")

  chirp3 = Artwork.create!(artist_id: hermione.id, title: "It’s wingardium leviOsa, not",img_url: "leviosAH.com")
  chirp4 = Artwork.create!(artist_id: hermione.id, title: "We could all have been killed or worse,", img_url: "expelled.com")
  chirp5 = Artwork.create!(artist_id: hermione.id, title: "Just because you have the emotional range of a teaspoon doesn’t mean we all", img_url: "have.com")

  chirp6 = Artwork.create!(artist_id: dumbledore.id, title: "Words are, in my not-so-humble opinion, our most inexhaustible source of", img_url: "magic.com")
  chirp7 = Artwork.create!(artist_id: dumbledore.id, title: "It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our ", img_url:"riends.com")
  chirp8 = Artwork.create!(artist_id: dumbledore.id, title: "It is our choices, Harry, that show what we truly are, far more than our", img_url: "abilities.com")
  chirp9 = Artwork.create!(artist_id: dumbledore.id, title: "Happiness can be found even in the darkest of times if only one remembers to turn on the", img_url: "light.com")

  ArtworkShare.destroy_all

  # Hagrid is nice and likes everyone's chirps (even his own)

  ArtworkShare.create!(viewer_id: hagrid.id, artwork_id: chirp2.id)
  ArtworkShare.create!(viewer_id: hagrid.id, artwork_id: chirp3.id)
  ArtworkShare.create!(viewer_id: hagrid.id, artwork_id: chirp4.id)
  ArtworkShare.create!(viewer_id: hagrid.id, artwork_id: chirp5.id)
  ArtworkShare.create!(viewer_id: hagrid.id, artwork_id: chirp6.id)
  ArtworkShare.create!(viewer_id: hagrid.id, artwork_id: chirp7.id)

  # Harry only likes Dumbledore's
  ArtworkShare.create!(viewer_id: harry.id, artwork_id: chirp5.id)
  ArtworkShare.create!(viewer_id: harry.id, artwork_id: chirp6.id)


  # Dumbledore is also nice and likes everyone's chirps (even his own)
  ArtworkShare.create!(viewer_id: dumbledore.id, artwork_id: chirp1.id)
  ArtworkShare.create!(viewer_id: dumbledore.id, artwork_id: chirp2.id)
  ArtworkShare.create!(viewer_id: dumbledore.id, artwork_id: chirp3.id)
  ArtworkShare.create!(viewer_id: dumbledore.id, artwork_id: chirp4.id)
  ArtworkShare.create!(viewer_id: dumbledore.id, artwork_id: chirp5.id)
end
