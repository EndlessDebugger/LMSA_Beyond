require 'rails_helper'

RSpec.describe "referrals/show", type: :view do
  before(:each) do
    @referral = assign(:referral, Referral.create!(
      old_member: 2,
      new_member: 3,
      guest_first_name: "Guest First Name",
      guest_last_name: "Guest Last Name",
      medical_prof: false,
      email: "Email",
      admin_approved: "Admin Approved"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Guest First Name/)
    expect(rendered).to match(/Guest Last Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Admin Approved/)
  end
end
