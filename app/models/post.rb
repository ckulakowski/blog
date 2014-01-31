class Post < ActiveRecord::Base
  #validations 
  validates_presence_of :title
  validates_presence_of :body
  
  #associations
  has_many :comments, as: :commentable
end
  