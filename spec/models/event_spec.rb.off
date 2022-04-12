require 'rails_helper'

RSpec.describe Event, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_attributes) do
    {
      event_id: Faker::Number.number(digits: 6),
      event_name: Faker::ChuckNorris.fact,
      event_type: "",
      event_date: Faker::Date.forward(days: 99),
      description: Faker::ChuckNorris.fact,
      event_creator: Faker::Number.number(digits: 6),
      virtual: false,
      password: Faker::Internet.password,
      meeting_link: Faker::Internet.url,
      signin_time: nil,
      point_val: Faker::Number.number(digits: 3),
      graphics: Faker::Internet.url,
      total_event_hr: Faker::Number.decimal(l_digits: 2)
    }
  end

  subject do
    described_class.new(valid_attributes)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an event name' do
    subject.event_name = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a date' do
    subject.event_date = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without a point value' do
    subject.point_val = nil
    expect(subject).not_to be_valid
  end


end
