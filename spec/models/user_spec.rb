require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:given_name) }
  it { should validate_presence_of(:family_name) }
  it { should validate_presence_of(:current_company) }
end
