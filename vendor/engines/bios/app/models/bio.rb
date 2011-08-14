class Bio < ActiveRecord::Base

  acts_as_indexed :fields => [:Name, :Instruments, :Details, :Facebook, :Email]

  validates :Name, :presence => true, :uniqueness => true
  
  belongs_to :Image, :class_name => 'Image'
end
