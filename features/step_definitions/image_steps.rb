When /^I upload "(.*)" as my "(.*)"/ do |file, type|
    attach_file("user[#{type}]", Rails.root.join('app', 'assets', 'images', file))
end

And /^I press the "(.*)" button/ do |name|
    click_button name
end

Then /^I should see pictures of different houses/ do
    pending
end

Then /^I should see more pictures/ do
    pending
end

Then /^I should see an error with a message containing "([^"]+)"(?: and "([^"]+)")?/ do |message1, message2|
    pending
end

Then /the "(.*)" should be added to the post/ do |type|
    expect(page).to have_xpath("//img", id: type)
end

Then /the file should not be uploaded/ do
    pending
end

Then /the profile should remain unchanged/ do
    pending
end
