require 'rails_helper'

RSpec.describe "event_hists/index", type: :view do
  before(:each) do
    assign(:event_hists, [
      EventHist.create!(
        event_id: 2,
        user_id: 3,
        sign_in: false,
        point_recv: 4
      ),
      EventHist.create!(
        event_id: 2,
        user_id: 3,
        sign_in: false,
        point_recv: 4
      )
    ])
  end

  it "renders a list of event_hists" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
