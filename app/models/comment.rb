class Comment < ActiveRecord::Base
  validates :user_name, :presence => true
  validates :comment_text, :presence => true 
end
