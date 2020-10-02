class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :message
      t.integer :attendance
      t.references :event, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
