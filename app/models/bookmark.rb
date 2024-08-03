# frozen_string_literal: true

# Validation du modèle Bookmarks
class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6, message: 'Un commentaire doit avoir au moins 6 caractères.' }
  validates :movie_id, uniqueness: { scope: :list_id, message: 'Ce marque-page a déjà été ajouté !' }
end
