require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Event Name/)
    expect(rendered).to match(/Event Type/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Meeting Link/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Graphics/)
    expect(rendered).to match(/5.5/)
  end
end
