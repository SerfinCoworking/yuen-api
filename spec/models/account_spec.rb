require 'rails_helper'

RSpec.describe Account, type: :model do
  # ensure columns name, user, company and account_type are present 
  it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:user) }
  it { should validate_presence_of(:account_type) }
  it { should validate_presence_of(:company) }
end
