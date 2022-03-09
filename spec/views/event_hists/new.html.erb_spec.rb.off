require 'rails_helper'

RSpec.describe 'event_hists/new', type: :view do
  before(:each) do
    assign(:event_hist, EventHist.new(
                          event_id: 1,
                          user_id: 1,
                          sign_in: 'False',
                          point_recv: 1
                        ))
  end

  it 'renders new event_hist form' do
    render

    assert_select 'form[action=?][method=?]', event_hists_path, 'post' do
      assert_select 'input[name=?]', 'event_hist[event_id]'

      assert_select 'input[name=?]', 'event_hist[user_id]'

      assert_select 'input[name=?]', 'event_hist[sign_in]'

      assert_select 'input[name=?]', 'event_hist[point_recv]'
    end
  end
end
