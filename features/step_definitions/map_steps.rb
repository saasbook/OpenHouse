Then /I should see object "(.*)" with id "(.*)"/ do |type, id|
    find(type, id: id)
end
