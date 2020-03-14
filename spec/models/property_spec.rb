require 'rails_helper'

RSpec.describe Property, type: :model do
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:map) }
  it { should validate_presence_of(:pictures) }

  describe 'associations' do
    it { is_expected.to belong_to :landlord }
    it { is_expected.to have_one :contract }
  end
end
