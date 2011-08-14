class Link < ActiveRecord::Base

  acts_as_indexed :fields => [:Title, :Url]

  validates :Title, :presence => true, :uniqueness => true
  
end
