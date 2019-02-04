class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :songs_genres
  has_many :genres, through: :songs_genres

  def slug
    self.name.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Song.find_by(name: (slug.gsub("-", " ")))
  end
end
