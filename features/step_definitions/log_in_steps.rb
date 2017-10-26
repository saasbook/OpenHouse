Then /the following accounts exist/ do |users_table|
  users_table.hashes.each do |user|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    User.create(user)
  end
end

Then /I should be logged in as user with email "(.*)"/ do |e|
    user = User.find_by(email: e ) 
    expect(user.id.equals(session[:user_id]))
end

Then /I should see an error message/ do
    step %{I should see "Invalid email/password combination"}
end