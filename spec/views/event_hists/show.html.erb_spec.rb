require 'rails_helper'

RSpec.describe "event_hists/show", type: :view do
  before(:each) do
    @event_hist = assign(:event_hist, EventHist.create!(
      event_id: 2,
      user_id: 3,
      sign_in: false,
      point_recv: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/4/)
  end
end
