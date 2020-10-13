class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos, id: :uuid do |t|
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.references :contact, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
