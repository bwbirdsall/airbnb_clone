require 'spec_helper'
require 'pry'

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

  context 'create property with image' do
    it 'lets owners create a new property with a photo' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link 'Add a Property to Rent'
      property = FactoryGirl.build :property
      attach_file "Add a Picture of your Property", File.expand_path("./app/assets/images/porchfabric007.jpg")
      #attach_file('Add a Picture of your Property', '/Users/epicodus/Documents/porchfabric007.jpg')
      create_property(property)
      expect(page).to have_content "Pictures of this Property:"
      page.should have_xpath "//img[@alt='Porchfabric007']"
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

    it 'lets owners create a new property with a photo' do
      user = FactoryGirl.build :user
      create_user_and_sign_in(user)
      click_link 'Add a Property to Rent'
      property = FactoryGirl.build :property
      create_property(property)
      click_link 'Edit Your Listing'
      attach_file "Add a Picture of your Property", File.expand_path("./app/assets/images/porchfabric007.jpg")
      click_button 'Save Property'
      expect(page).to have_content "Pictures of this Property:"
      page.should have_xpath "//img[@alt='Porchfabric007']"
    end

  end
end
