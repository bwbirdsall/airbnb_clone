require 'spec_helper'

describe Property do
  context 'create property' do
    it 'lets owners create a new property' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link 'Add a Property to Rent'
      property = FactoryGirl.build :property
      create_property(property)
      page.should have_content 'Your property was uploaded!'
    end
  end

  context 'edit property' do
    it 'lets owners edit their properties' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link 'Add a Property to Rent'
      property = FactoryGirl.build :property
      create_property(property)
      click_link 'Edit Your Listing'
      fill_in 'Name', with: "Billy's Brother's Room!"
      click_button 'Save Property'
      page.should have_content "Billy's Brother's Room!"
    end
  end
end
