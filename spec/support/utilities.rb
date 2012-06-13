include ApplicationHelper

def valid_registration
	fill_in "Name",			with: "Example User"
	fill_in "Email", 		with: "user@example.com"
	fill_in "Password",		with: "foobar"
	fill_in "Confirmation", with: "foobar"
end

def valid_signin(user)
	fill_in "Email",	with: user.email
	fill_in "Password",	with: user.password
	click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: message)
	end
end

RSpec::Matchers.define :have_title do |title|
	match do |page|
		page.should have_selector('title', text: title)
	end
end