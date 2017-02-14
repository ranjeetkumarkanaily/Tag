class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :entity_type
      t.string :entity_id
      t.string :tags, array: true 

      t.timestamps
    end
    add_index :tags, :tags, using: 'gin'
  end
end
