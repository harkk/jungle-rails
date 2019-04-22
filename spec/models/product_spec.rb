require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Validations' do
    
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }

  end
end
