class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :list, optional: true
end
