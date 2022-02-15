require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        event_id: 2,
        event_name: "Event Name",
        event_type: "Event Type",
        description: "Description",
        event_creator: 3,
        virtual: false,
        password: "Password",
        meeting_link: "Meeting Link",
        point_val: 4,
        graphics: "Graphics",
        total_event_hr: 5.5
      ),
      Event.create!(
        event_id: 2,
        event_name: "Event Name",
        event_type: "Event Type",
        description: "Description",
        event_creator: 3,
        virtual: false,
        password: "Password",
        meeting_link: "Meeting Link",
        point_val: 4,
        graphics: "Graphics",
        total_event_hr: 5.5
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Event Name".to_s, count: 2
    assert_select "tr>td", text: "Event Type".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: "Meeting Link".to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Graphics".to_s, count: 2
    assert_select "tr>td", text: 5.5.to_s, count: 2
  end
end
