require 'rails_helper'

RSpec.describe Car, type: :model do
  context 'without a name' do
    it 'is not valid' do
      car = Car.new(name: nil)
      expect(car).to_not be_valid
    end
  end

  context 'with negative price' do
    it 'is not valid' do
      car = Car.new(name: 'Renault', price_per_h: -3)
      expect(car).to_not be_valid
    end
  end
end
