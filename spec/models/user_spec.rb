require 'rails_helper'

RSpec.describe User, type: :model do
  # ensure columns username are present 
  it { should validate_presence_of(:username) }
end
