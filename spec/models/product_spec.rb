require 'rails_helper'

RSpec.describe Product, type: :model do
  # ensure columns company and name are present 
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:name) }
end
