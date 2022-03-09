require 'rails_helper'

RSpec.describe 'referrals/index', type: :view do
  before(:each) do
    assign(:referrals, [
             Referral.create!(
               old_member: 2,
               new_member: 3,
               guest_first_name: 'Guest First Name',
               guest_last_name: 'Guest Last Name',
               medical_prof: false,
               email: 'Email',
               admin_approved: 'Admin Approved'
             ),
             Referral.create!(
               old_member: 2,
               new_member: 3,
               guest_first_name: 'Guest First Name',
               guest_last_name: 'Guest Last Name',
               medical_prof: false,
               email: 'Email',
               admin_approved: 'Admin Approved'
             )
           ])
  end

  it 'renders a list of referrals' do
    render
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
    assert_select 'tr>td', text: 'Guest First Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Guest Last Name'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
    assert_select 'tr>td', text: 'Admin Approved'.to_s, count: 2
  end
end
