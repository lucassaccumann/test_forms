class ChangeTypeTypeinFields < ActiveRecord::Migration
  def change
  	change_column :fields, :type, :text
  end
end
