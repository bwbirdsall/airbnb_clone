require 'spec_helper'

describe Review do
  it { should belong_to :user }
  it { should belong_to :property }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :property_id }
  it { should validate_presence_of :header }
  it { should validate_presence_of :body }
end
