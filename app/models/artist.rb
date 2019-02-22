class Artist < ApplicationRecord
  has_many :songs
  has_many :lists, through: :songs
end
