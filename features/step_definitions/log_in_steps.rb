Then /I should be logged in as user with email "(.*)"/ do |e|
    user = User.find_by(email: e ) 
    expect(user.email == session[:email])
end

Then /I should see an error message/ do
    step %{I should see "Invalid email/password combination"}
end