class List < ApplicationRecord
  has_many :songs
  has_many :artists, through: :songs, dependent: :destroy
end
