class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :order
      t.string :title
      t.integer :type
      t.text :values

      t.timestamps null: false
    end
  end
end
