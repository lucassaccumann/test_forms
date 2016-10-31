class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :fields
  before_create :generate_slug
  before_update :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

  def to_param
    slug
  end
 
end
