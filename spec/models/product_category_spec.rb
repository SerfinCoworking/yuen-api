require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  # ensure column name and company are present
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:company) }
end
