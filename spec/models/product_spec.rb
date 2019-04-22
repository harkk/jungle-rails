require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    subject {
    Product.new(name: "Hot Wheels E30 Model Car", price_cents: 900, quantity: 3, category: Category.new(name: "Toys"))
  }
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end

# RSpec.describe Product, type: :model do
#   context 'Validations' do
#     
#     it { is_expected.to validate_presence_of(:name) }
#     it { is_expected.to validate_presence_of(:price) }
#     it { is_expected.to validate_presence_of(:quantity) }
#     it { is_expected.to validate_presence_of(:category) }
# 
#   end
# end
