class List < ApplicationRecord
  belongs_to :user
  has_many :songs
  has_many :artists, through: :songs, dependent: :destroy
end
