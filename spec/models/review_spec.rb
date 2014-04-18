require 'spec_helper'

describe Review do
  it { should belong_to :user }
  it { should belong_to :property }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :property_id }
end
