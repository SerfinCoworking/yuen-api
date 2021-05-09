require 'rails_helper'

RSpec.describe Company, type: :model do
  # ensure columns name is present 
  it { should validate_presence_of(:name) }
end
