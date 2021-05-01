require 'rails_helper'

RSpec.describe CompanyUser, type: :model do
  # ensure columns user and company are present 
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:company) }
end
