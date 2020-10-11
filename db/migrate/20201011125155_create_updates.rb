class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates, id: :uuid do |t|
      t.text :text
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.references :contact, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
