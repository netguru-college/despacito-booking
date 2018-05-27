require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject { described_class.new }
  # let(:user) { User.create!(password: "password", password_confirmation: "password", email: "email@wp.pl") }
  let(:user) { create(:admin) }
  let(:resource) { create(:resource) }

  it { should belong_to(:user) }
  it { should belong_to(:resource) }

  it "is valid with valid attributes" do
    subject.user_id = user.id
    subject.resource_id = resource.id
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.date_to = "2019-03-03T04:05:06+00:00"
    subject.total_price = 12
    expect(subject).to be_valid
  end

  it "is not valid with negative total price" do
    subject.user_id = 12
    subject.resource_id = 13
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.date_to = "2019-02-03T04:05:06+00:00"
    subject.total_price = -5
    expect(subject).to_not be_valid
  end

  it "is not valid with start date from the past" do
    subject.user_id = 12
    subject.resource_id = 13
    subject.date_from = "2011-02-03T04:05:06+00:00"
    subject.date_to = "2019-02-03T04:05:06+00:00"
    subject.total_price = 0
    expect(subject).to_not be_valid
  end

  it "is not valid without user id" do
    subject.resource_id = 13
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.date_to = "2019-02-03T04:05:06+00:00"
    subject.total_price = 0
    expect(subject).to_not be_valid
  end

  it "is not valid without resource id" do
    subject.user_id = 12
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.date_to = "2019-02-03T04:05:06+00:00"
    subject.total_price = 0
    expect(subject).to_not be_valid
  end

  it "is not vaild without start date" do
    subject.user_id = 12
    subject.resource_id = 13
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.total_price = 0
    expect(subject).to_not be_valid
  end

  it "is not valid without ending date" do
    subject.user_id = 12
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.resource_id = 13
    subject.total_price = 0
    expect(subject).to_not be_valid
  end

  it "is not valid without total price" do
    subject.user_id = 12
    subject.resource_id = 13
    subject.date_from = "2019-02-03T04:05:06+00:00"
    subject.date_to = "2019-02-03T04:05:06+00:00"
    expect(subject).to_not be_valid
  end
end
