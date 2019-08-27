class Collection < ApplicationRecord
    belongs_to :user,
        foreign_key: :user_id,
        class_name: 'User'

    has_many :art_collections,
        foreign_key: :collection_id,
        class_name: 'ArtCollection'
end
