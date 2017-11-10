Then /I should see object "(.*)" with id "(.*)"/ do |type, id|
    find(type, id: id)
end

Then /the location of "(.*)" should be correct/ do |name|
    @user = User.find_by(:first_name => name)
end