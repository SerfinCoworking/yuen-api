require 'rails_helper'

RSpec.describe StockLocation, type: :model do
  # ensure name and company are present 
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company) }
end
