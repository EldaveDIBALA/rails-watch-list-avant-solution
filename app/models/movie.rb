# frozen_string_literal: true

# Validation du modèle Movie
class Movie < ApplicationRecord
  has_many :bookmarks

  validates :overview, presence: true
  validates :title, presence: true, uniqueness: true
end
