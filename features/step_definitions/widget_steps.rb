Given /^I have no widgets$/ do
  Widget.delete_all
end


Then /^I should have ([0-9]+) widgets?$/ do |count|
  Widget.count.should == count.to_i
end
