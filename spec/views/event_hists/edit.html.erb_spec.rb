require 'rails_helper'

RSpec.describe "event_hists/edit", type: :view do
  before(:each) do
    @event_hist = assign(:event_hist, EventHist.create!(
      event_id: 1,
      user_id: 1,
      sign_in: false,
      point_recv: 1
    ))
  end

  it "renders the edit event_hist form" do
    render

    assert_select "form[action=?][method=?]", event_hist_path(@event_hist), "post" do

      assert_select "input[name=?]", "event_hist[event_id]"

      assert_select "input[name=?]", "event_hist[user_id]"

      assert_select "input[name=?]", "event_hist[sign_in]"

      assert_select "input[name=?]", "event_hist[point_recv]"
    end
  end
end
