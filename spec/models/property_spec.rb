require 'spec_helper'

describe Property do
  it { should belong_to :user }
  it { should validate_uniqueness_of(:name).scoped_to(:location)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :location }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price_day }
  it { should validate_presence_of :rental_type }
end
