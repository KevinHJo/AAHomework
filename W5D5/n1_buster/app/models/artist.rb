# == Schema Information
#
# Table name: artists
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self
      .albums
      .select('albums.title, COUNT(*) AS count')
      .joins(:tracks)
      .group('albums.title')
    
    albums_with_counts = Hash.new(0)
    albums.each do |album|
      albums_with_counts[album.title] = album.count
    end
    albums_with_counts
  end
end
