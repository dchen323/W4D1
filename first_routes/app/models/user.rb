# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true

  has_many :views,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :viewers,
    through: :views,
    source: :viewers

  has_many :shared_artworks,
    through: :views,
    source: :artwork

  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :artworks_commented_on,
    through: :comments,
    source: :artwork

  has_many :comments_on_artworks,
    through: :artworks_commented_on,
    source: :comments

  has_many :comments_on_own_artwork,
    through: :artworks,
    source: :comments

end
