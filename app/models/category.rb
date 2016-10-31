class Category < ActiveRecord::Base
  has_many :sub_categories
  before_create :generate_slug
  before_update :generate_slug
  
  def generate_slug
    self.slug = name.parameterize
  end
  def to_param
    slug
  end

  #accepts_nested_attributes_for :sub_categories, allow_destroy: true
  #attr_accessible :name, :slug
end
