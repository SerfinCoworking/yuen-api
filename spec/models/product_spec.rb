require 'rails_helper'

RSpec.describe Product, type: :model do
  # ensure columns name, company, category and unity are present 
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:unity) }
end
