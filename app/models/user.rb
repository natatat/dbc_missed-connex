class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  validates_presence_of :email, :password
  validates_uniqueness_of :email
end