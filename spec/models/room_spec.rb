require 'rails_helper'

RSpec.describe Room, type: :model do
  context 'without a name' do
    it 'is not valid' do
      room = Room.new(name: nil)
      expect(room).to_not be_valid
    end
  end

  context 'with negative price' do
    it 'is not valid' do
      room = Room.new(name: 'Apartament', price_per_night: -3)
      expect(room).to_not be_valid
    end
  end

  context 'with 0 number of beds' do
    it 'is not valid' do
      room = Room.new(name: 'Apartment', no_of_beds: 0)
      expect(room).to_not be_valid
    end
  end
end
