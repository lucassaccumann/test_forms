class Field < ActiveRecord::Base
  belongs_to :sub_category

  def self.tipos
    ['check_box', "text_field", 'text_area', "selection"]
  end

end
