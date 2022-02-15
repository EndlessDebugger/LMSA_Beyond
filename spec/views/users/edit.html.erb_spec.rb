require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      user_id: 1,
      major: "MyString",
      admin: false,
      email: "MyString",
      first_name: "MyString",
      last_name: "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[user_id]"

      assert_select "input[name=?]", "user[major]"

      assert_select "input[name=?]", "user[admin]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"
    end
  end
end
