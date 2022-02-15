require 'rails_helper'

RSpec.describe "poin_events/edit", type: :view do
  before(:each) do
    @poin_event = assign(:poin_event, PoinEvent.create!(
      user_id: 1,
      balance: 1,
      description: "MyString",
      admin_award_id: 1,
      hours_attend: 1.5
    ))
  end

  it "renders the edit poin_event form" do
    render

    assert_select "form[action=?][method=?]", poin_event_path(@poin_event), "post" do

      assert_select "input[name=?]", "poin_event[user_id]"

      assert_select "input[name=?]", "poin_event[balance]"

      assert_select "input[name=?]", "poin_event[description]"

      assert_select "input[name=?]", "poin_event[admin_award_id]"

      assert_select "input[name=?]", "poin_event[hours_attend]"
    end
  end
end
