require 'rails_helper'

RSpec.describe AccountType, type: :model do
    # ensure columns name is present 
    it { should validate_presence_of(:name) }
end
