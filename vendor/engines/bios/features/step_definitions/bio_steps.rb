Given /^I have no bios$/ do
  Bio.delete_all
end

Given /^I (only )?have bios titled "?([^\"]*)"?$/ do |only, titles|
  Bio.delete_all if only
  titles.split(', ').each do |title|
    Bio.create(:Name => title)
  end
end

Then /^I should have ([0-9]+) bios?$/ do |count|
  Bio.count.should == count.to_i
end
