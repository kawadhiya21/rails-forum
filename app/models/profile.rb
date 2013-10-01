class Profile < ActiveRecord::Base
  attr_accessible :birth, :name, :picture, :user_id
  belongs_to :user
end
