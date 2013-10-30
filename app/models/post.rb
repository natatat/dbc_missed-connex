class Post < ActiveRecord::Base
  attr_accessible :title, :description, :category_id

  validates_presence_of :title, :description
  belongs_to :category
end