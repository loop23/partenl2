class CreateParagraphs < ActiveRecord::Migration[5.0]
  def change
    create_table :paragraphs do |t|
      t.text :content, null: false
      t.integer :order, null: false
      t.references :section, foreign_key: true
      t.references :paragraph, foreign_key: true
      t.timestamps
    end
  end
end
