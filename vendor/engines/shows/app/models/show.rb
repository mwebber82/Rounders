class Show < ActiveRecord::Base

  acts_as_indexed :fields => [:Title, :OtherBands, :Details, :Location, :Street, :City, :Province, :Zip, :Country, :Phone, :Website, :Admission]

  validates :Title, :presence => true, :uniqueness => true
  
  belongs_to :Thumbnail, :class_name => 'Image'
end
