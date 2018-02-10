class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.belongs_to :coordinator, class_name: 'User'
      t.timestamps
    end
  end
end
