require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_attributes) do
    {
      #user_id: Faker::Number.number(digits: 6),
      major: Faker::Educator.subject,
      admin: false,
      email: Faker::Internet.email(domain: 'gmail.com'),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    }
  end

  subject do
    described_class.new(valid_attributes)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

end
