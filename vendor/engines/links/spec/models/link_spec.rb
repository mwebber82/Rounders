require 'spec_helper'

describe Link do

  def reset_link(options = {})
    @valid_attributes = {
      :id => 1,
      :Title => "RSpec is great for testing too"
    }

    @link.destroy! if @link
    @link = Link.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_link
  end

  context "validations" do
    
    it "rejects empty Title" do
      Link.new(@valid_attributes.merge(:Title => "")).should_not be_valid
    end

    it "rejects non unique Title" do
      # as one gets created before each spec by reset_link
      Link.new(@valid_attributes).should_not be_valid
    end
    
  end

end