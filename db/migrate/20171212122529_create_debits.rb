class CreateDebits < ActiveRecord::Migration[5.1]
  def change
    create_table :debits do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :group, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.boolean :status, default: true
      t.date :end
    end
  end
end
