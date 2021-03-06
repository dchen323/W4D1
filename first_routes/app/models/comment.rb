# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer          not null
#  artwork_id :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :author,
  primary_key: :id,
  foreign_key: :author_id,
  class_name: :User

  belongs_to :artwork,
  primary_key: :id,
  foreign_key: :artwork_id,
  class_name: :Artwork


end
