require 'spec_helper'

describe Property do
  it { should belong_to :user }
  it { should have_many :pictures }

  it { should validate_uniqueness_of(:name).scoped_to(:location)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :location }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price_day }
  it { should validate_presence_of :rental_type }

  describe '.expensive' do
    it 'returns all the properties that are priced over or equal to 50$ per day' do
    expensive_property = FactoryGirl.create(:property, :price_day => 65)
    cheap_property = FactoryGirl.create(:property, :price_day => 30)
    Property.expensive.should eq [expensive_property]
    end
  end

  describe '.reasonable' do
    it 'returns all the properties that are priced under 50$ and over 20$ per day' do
    expensive_property = FactoryGirl.create(:property, :price_day => 65)
    cheap_property = FactoryGirl.create(:property, :price_day => 10)
    middy_property = FactoryGirl.create(:property, :price_day => 40)
    Property.reasonable.should eq [middy_property]
    end
  end

  describe '.cheap' do
    it 'returns all the properties that are priced under or equal to 20$ per day' do
    expensive_property = FactoryGirl.create(:property, :price_day => 65)
    cheap_property = FactoryGirl.create(:property, :price_day => 10)
    middy_property = FactoryGirl.create(:property, :price_day => 40)
    Property.cheap.should eq [cheap_property]
    end
  end
end
