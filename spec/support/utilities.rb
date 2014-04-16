def create_user_and_sign_in(user)
  visit root_path
  click_link 'Sign up'
  fill_in 'Email', with: user.email
  fill_in 'Username', with: user.username
  fill_in 'Password', with: user.password
  fill_in 'Password confirmation', with: user.password
  click_button 'Sign up'
end

def create_property(property)
  fill_in 'Name', with: property.name
  fill_in 'Description', with: property.description
  fill_in 'Location', with: property.location
  select('Entire Place', :from => 'Rental type')
  fill_in 'Price per Day', with: property.price_day
  click_button 'Save Property'
end
