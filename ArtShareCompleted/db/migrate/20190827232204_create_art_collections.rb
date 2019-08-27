class CreateArtCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :art_collections do |t|
      t.integer :collection_id, null: false
      t.integer :artwork_id, null:false

      t.timestamps
    end

    add_index :art_collections, [:collection_id, :artwork_id]
  end
end
