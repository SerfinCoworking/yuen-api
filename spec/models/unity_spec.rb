require 'rails_helper'

RSpec.describe Unity, type: :model do
  it { should validate_presence_of(:unity_type) }
  it { should validate_presence_of(:symbol) }
  it { should validate_presence_of(:equivalence) }
  it { should validate_presence_of(:equivalence_unit) }
end