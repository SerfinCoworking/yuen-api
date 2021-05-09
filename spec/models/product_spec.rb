require 'rails_helper'

RSpec.describe Product, type: :model do
  # ensure columns name, company and category are present 
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:category) }
end
