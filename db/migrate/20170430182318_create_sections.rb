class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :title
      t.boolean :editable
      t.text :content
      t.integer :order
      t.references :document, foreign_key: true

      t.timestamps
    end
  end
end
