# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default(FALSE)
#

class Artwork < ApplicationRecord
    validates :favorite, inclusion: {in: [false, true] }

    belongs_to :artist,
        foreign_key: :artist_id,
		class_name: 'User'
    
    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: 'ArtworkShare',
        dependent: :destroy

    has_many :shared_viewers,
		through: :artwork_shares,
        source: :viewer
        
    has_many :comments,
        foreign_key: :artwork_id,
        class_name: 'Comment',
        dependent: :destroy

    has_many :likes, as: :likeable
end

# multiple favorites
    # add migration for artwork / artwork share
        # artworks - (favoritng of artworks by their owner(
        # user --> artworks (??? maybe not)
        # make a post to an unfavorite to toggle favorite (boolean type)

    # boolean on the artwork itself
        # artwork favorite applies to all users

    # shared artworks
        # (favoriting of artworks shared to a user)

        # VVVVVVV
    # artwork itself is labelled as a favorite artwork (admin)
