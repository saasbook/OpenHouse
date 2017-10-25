Given /I am not logged in/ do 
    # Logout
end

Given /I am logged in/ do 
    # Login
end

Given /username "(.*)" with password "(.*)" exists/ do |username, password|
    User.create!(:username => username, :password => password)
end

Given /username "(.*)" with password "(.*)" does not exist/ do |username, password|
    @user = User.find_by(:username => username, :password => password)
    @user.destroy
end

Then /I should be logged in/ do
    # Logged In
    # Expect
end
