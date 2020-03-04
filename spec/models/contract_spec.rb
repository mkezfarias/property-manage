require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { is_expected.to belong_to(:property) }
  it { is_expected.to belong_to(:landlord) }
  it { is_expected.to belong_to(:tenant) }

  describe 'validation' do
    it { is_expected.to validate_presence_of(:property_id) }
    it { is_expected.to validate_presence_of(:tenant_id) }
    it { is_expected.to validate_presence_of(:landlord_id) }
  end
end
