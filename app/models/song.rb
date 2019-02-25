class Song < ApplicationRecord
  belongs_to :artist, optional: false
  belongs_to :list, optional: true
end
