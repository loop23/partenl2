class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :oauth_token
      t.string :locale, size: 2, null: false, default: 'it'
      t.datetime :oauth_expires_at
      t.boolean :admin, default: false, null: false
      t.timestamps
    end
  end
end
