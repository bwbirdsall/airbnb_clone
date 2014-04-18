require 'spec_helper'

describe User do
  it { should have_many :properties }
  it { should have_many :pictures }
  it { should have_many :reviews }
end
