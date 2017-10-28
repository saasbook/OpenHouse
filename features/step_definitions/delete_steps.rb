Given /I am logged in as user with email "([^"]*)"/ do |e|
    user = User.find_by(email: e ) 
    expect(user.email == e)
end
Then /I do not see "([^"]*)"$/ do |text|
  expect(page.has_no_content?(text) == false)
end