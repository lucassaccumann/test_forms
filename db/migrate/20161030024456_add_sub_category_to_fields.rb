class AddSubCategoryToFields < ActiveRecord::Migration
  def change
    add_reference :fields, :sub_category, index: true
    add_foreign_key :fields, :sub_categories
  end
end
