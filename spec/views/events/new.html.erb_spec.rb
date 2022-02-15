require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      event_id: 1,
      event_name: "MyString",
      event_type: "MyString",
      description: "MyString",
      event_creator: 1,
      virtual: false,
      password: "MyString",
      meeting_link: "MyString",
      point_val: 1,
      graphics: "MyString",
      total_event_hr: 1.5
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input[name=?]", "event[event_id]"

      assert_select "input[name=?]", "event[event_name]"

      assert_select "input[name=?]", "event[event_type]"

      assert_select "input[name=?]", "event[description]"

      assert_select "input[name=?]", "event[event_creator]"

      assert_select "input[name=?]", "event[virtual]"

      assert_select "input[name=?]", "event[password]"

      assert_select "input[name=?]", "event[meeting_link]"

      assert_select "input[name=?]", "event[point_val]"

      assert_select "input[name=?]", "event[graphics]"

      assert_select "input[name=?]", "event[total_event_hr]"
    end
  end
end
