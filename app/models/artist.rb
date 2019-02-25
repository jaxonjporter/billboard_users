class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy
  has_many :lists, through: :songs, dependent: :destroy
end
