class Comment < ActiveRecord::Base
  #validations
  validates_presence_of :author
  validates_presence_of :body
  
  #associations
  belongs_to :commentable, polymorphic: true
end
