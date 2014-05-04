Given(/^I am on the front page$/) do
  visit '/'
end

Then(/^I can see a link with text '(.*)'$/) do |text|
  page.should have_link text
end

And(/^I click '(.*)'$/) do |text|
  click_on text
end

Then(/^I should see '(.*)'$/) do |text|
  page.should have_content text
end

Then(/^I should not see '(.*)'$/) do |text|
  page.should_not have_content text
end

Given(/^I am viewing (.*)$/) do |url|
  visit "/#{url}"
end

Then(/^I should be prompted for login$/) do
  page.should have_content 'Login'
  page.should have_content 'Username'
  page.should have_content 'Password'
end

And(/^I input '(.*)' to '(.*)'$/) do |input, field|
  fill_in field, with: input
end

Given(/^I am a logged in user$/) do
  step %{I am viewing login}
  step %{I input 'test_user' to 'username'}
  step %{I input 'test_user' to 'password'}
  step %{I click 'Log in'}
end

And(/^I select '(.*)' as '(.*)'$/) do |option, input|
  page.select(option, :from => input)
end