class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.string :state
      t.integer :amount
      t.string :checkout_session_id
      t.references :event, null: false, foreign_key: true, type: :uuid
      t.references :contact, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
