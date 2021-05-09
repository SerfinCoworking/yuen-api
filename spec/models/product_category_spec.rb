require 'rails_helper'

RSpec.describe ProductCategory, type: :model do
  # ensure column name is present
  it { should validate_presence_of(:name) }
end
