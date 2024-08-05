# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'faker'

require 'open-uri'
require 'json'

# 25.times do
#   Movie.create(
#     title: Faker::Movie.title,
#     overview: Faker::Movie.quote,
#     poster_url: Faker::LoremFlickr.image(siez: '500x750', search_term: ['movie']),
#     rating: Faker::Number.decimal(l_digits: 1, r_digits: 1).to_f
#   )
# end

# URL de l'API pour les vrais films ave l'API
url = 'https://tmdb.lewagon.com/movie/top_rated'
response = URI.open(url).read
data = JSON.parse(response)

# Pour l'extraction de la liste des films
movies = data['results']

movies.each do |movie|
  # Pour créer un enregistrement de chaque film
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}",
    rating: movie['rating']
  )
end
