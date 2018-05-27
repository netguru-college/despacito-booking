require 'rails_helper'

RSpec.describe Room, type: :model do
  subject { described_class.new(name: 'Apartment', price_per_night: 10,
                                no_of_beds: 1) }

  context 'without a name' do
    it 'is not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'with negative price' do
    it 'is not valid' do
      subject.price_per_night = -3
      expect(subject).to_not be_valid
    end
  end

  context 'with 0 number of beds' do
    it 'is not valid' do
      subject.no_of_beds = 0
      expect(subject).to_not be_valid
    end
  end
end
