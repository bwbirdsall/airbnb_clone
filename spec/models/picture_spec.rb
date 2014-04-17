require 'spec_helper'

describe Picture do
  it { should belong_to :user }
  it { should belong_to :property }
end
