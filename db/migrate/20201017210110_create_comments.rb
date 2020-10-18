class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :text
      t.references :commentable, :polymorphic => true, null: false, index: false, type: :uuid
      t.references :contact, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
