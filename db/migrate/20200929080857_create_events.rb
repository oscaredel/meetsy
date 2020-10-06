class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events, id: :uuid do |t|
      t.string :name
      t.datetime :starts_at
      t.string :location
      t.text :description
      t.references :organiser, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
