Given /^I have no shows$/ do
  Show.delete_all
end

Given /^I (only )?have shows titled "?([^\"]*)"?$/ do |only, titles|
  Show.delete_all if only
  titles.split(', ').each do |title|
    Show.create(:Title => title)
  end
end

Then /^I should have ([0-9]+) shows?$/ do |count|
  Show.count.should == count.to_i
end
