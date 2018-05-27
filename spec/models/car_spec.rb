require 'rails_helper'

RSpec.describe Car, type: :model do
  subject { described_class.new(name: 'Renault', price_per_h: 10) }

  context 'without a name' do
    it 'is not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'with negative price' do
    it 'is not valid' do
      subject.price_per_h = -5
      expect(subject).to_not be_valid
    end
  end
end
