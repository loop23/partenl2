class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.boolean :up, default: true
      t.references :user, foreign_key: true
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
