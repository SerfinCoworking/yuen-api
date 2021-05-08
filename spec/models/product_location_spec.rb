require 'rails_helper'

RSpec.describe ProductLocation, type: :model do
  # ensure name is present 
  it { should validate_presence_of(:name) }
end
