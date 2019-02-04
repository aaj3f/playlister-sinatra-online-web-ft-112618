class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists, :through => :songs

  def slug
    self.name.gsub(" ", "-")
  end

  def self.find_by_slug(slug)
    Genre.find_by(name: (slug.gsub("-", " ")))
  end
end
