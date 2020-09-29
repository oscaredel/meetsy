class CreateResponses < ActiveRecord::Migration[6.0]
  def change
    create_table :responses do |t|
      t.string :name
      t.string :email
      t.string :message
      t.integer :attendence
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
