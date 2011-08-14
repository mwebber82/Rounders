class Video < ActiveRecord::Base

  acts_as_indexed :fields => [:Title, :Description, :Video]

  validates :Title, :presence => true, :uniqueness => true
  
end
