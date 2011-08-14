require 'spec_helper'

describe Bio do

  def reset_bio(options = {})
    @valid_attributes = {
      :id => 1,
      :Name => "RSpec is great for testing too"
    }

    @bio.destroy! if @bio
    @bio = Bio.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_bio
  end

  context "validations" do
    
    it "rejects empty Name" do
      Bio.new(@valid_attributes.merge(:Name => "")).should_not be_valid
    end

    it "rejects non unique Name" do
      # as one gets created before each spec by reset_bio
      Bio.new(@valid_attributes).should_not be_valid
    end
    
  end

end