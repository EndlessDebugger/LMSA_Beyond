require 'rails_helper'

RSpec.describe "poin_events/index", type: :view do
  before(:each) do
    assign(:poin_events, [
      PoinEvent.create!(
        user_id: 2,
        balance: 3,
        description: "Description",
        admin_award_id: 4,
        hours_attend: 5.5
      ),
      PoinEvent.create!(
        user_id: 2,
        balance: 3,
        description: "Description",
        admin_award_id: 4,
        hours_attend: 5.5
      )
    ])
  end

  it "renders a list of poin_events" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.5.to_s, count: 2
  end
end
