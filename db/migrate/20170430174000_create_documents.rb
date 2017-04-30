class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :description
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
