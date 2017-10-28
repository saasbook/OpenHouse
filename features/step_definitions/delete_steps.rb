Given /I am logged in as user with email "([^"]*)"/ do |e|
    user = User.find_by(email: e ) 
    expect(user.email == e)
end

Then /account with email "(.*)" should( not)? exist in the database/ do |e, should_not_exist|
  user = User.find_by(email: e)
  if should_not_exist
      expect(user == nil)
  else
      expect(user.email == e)
  end
end

