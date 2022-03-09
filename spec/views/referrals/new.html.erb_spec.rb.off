require 'rails_helper'

RSpec.describe 'referrals/new', type: :view do
  before(:each) do
    assign(:referral, Referral.new(
                        old_member: 1,
                        new_member: 1,
                        guest_first_name: 'MyString',
                        guest_last_name: 'MyString',
                        medical_prof: false,
                        email: 'MyString',
                        admin_approved: 'MyString'
                      ))
  end

  it 'renders new referral form' do
    render

    assert_select 'form[action=?][method=?]', referrals_path, 'post' do
      assert_select 'input[name=?]', 'referral[old_member]'

      assert_select 'input[name=?]', 'referral[new_member]'

      assert_select 'input[name=?]', 'referral[guest_first_name]'

      assert_select 'input[name=?]', 'referral[guest_last_name]'

      assert_select 'input[name=?]', 'referral[medical_prof]'

      assert_select 'input[name=?]', 'referral[email]'

      assert_select 'input[name=?]', 'referral[admin_approved]'
    end
  end
end
