require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            user_id: 2,
                            major: 'Major',
                            admin: 'False',
                            email: 'Email',
                            first_name: 'First Name',
                            last_name: 'Last Name'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Major/)
    expect(rendered).to match(/False/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
  end
end
