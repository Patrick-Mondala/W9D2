# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorite   :boolean          default(FALSE)
#

class ArtworkShare < ApplicationRecord
    validates :artwork_id, null: false, uniqueness: { scope: :viewer_id }
    validates :viewer_id, null: false
    validates :favorite, inclusion: {in: [false, true] }
    
    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: 'Artwork'

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: 'User'

    
end

# favorite column 
    # only allowing piece of artwork to be toggled fav on / off
    # if user id is the artist id
    # user.id <-> artist.id

    # only allowing artwork share
    # artwork_share.id <-> viewer.id pointing to the user.id

    # user.id = art owner 


