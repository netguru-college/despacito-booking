require 'rails_helper'

RSpec.describe Hotel, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.name = 'Anything'
    subject.address = 'Somewhere'
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without an address' do
    expect(subject).to_not be_valid
  end

  it 'geocodes the address properly' do
    subject.address = 'Al. Grunwaldzka 103A, 80-244 Gdańsk, Poland'
    subject.save

    expect(subject.latitude).to eq(54.3795614)
    expect(subject.longitude).to eq(18.6049749)
  end
end
