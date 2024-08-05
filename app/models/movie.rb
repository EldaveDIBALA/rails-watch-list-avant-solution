# frozen_string_literal: true

# Validation du modèle Movie
class Movie < ApplicationRecord
  has_many :bookmarks

  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
  # validates :rating, numericality: {
  #   greater_than_or_equal_to: 0,
  #   less_than_or_equal_to: 10,
  #   message: 'Votre note doit être comprise entre 0 et 10'
  # }
end
