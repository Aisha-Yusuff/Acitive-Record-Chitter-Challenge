class Peep < ActiveRecord::Base
  validates_presence_of :contents
  belongs_to :users
end 
