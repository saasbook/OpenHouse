Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Then /account with email "(.*)" should( not)? exist/ do |e, should_not_exist|
  user = User.find_by(email: e)
  if should_not_exist
      expect(user == nil)
  else
      expect(user.email == e)
  end
end

Given /the following accounts exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end
