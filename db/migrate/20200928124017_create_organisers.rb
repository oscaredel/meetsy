class CreateOrganisers < ActiveRecord::Migration[6.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

  def change
    create_table :organisers, id: :uuid do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
