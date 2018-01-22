class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.belongs_to :template, foreign_key: true
      t.string :company
      t.text :properties
      t.integer :year
      t.integer :warranty
      t.date :warranty_end
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
