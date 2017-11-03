And /I click the first "(.*)"/ do |p|
    first(:link, p).click
end

When /^I execute a search$/ do
    pending
end

# maybe do something like "When I search for XX with filter XX"
