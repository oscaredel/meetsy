class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date_time
      t.string :location
      t.text :description
      t.string :organiser_name
      t.string :organiser_email

      t.timestamps
    end
  end
end
