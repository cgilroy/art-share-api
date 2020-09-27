
class Artwork < ActiveRecord
    validates :title, :image_url, presence:true
    validates :image_url, uniqueness:true
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist, primary_key: :id, foreign_key: :artist_id, class_name: 'User'
end