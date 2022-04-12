require 'rails_helper'

RSpec.describe 'poin_events/show', type: :view do
  before(:each) do
    @poin_event = assign(:poin_event, PoinEvent.create!(
                                        user_id: 2,
                                        balance: 3,
                                        description: 'Description',
                                        admin_award_id: 4,
                                        hours_attend: 5.5
                                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5.5/)
  end
end
