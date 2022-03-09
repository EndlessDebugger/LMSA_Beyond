require 'rails_helper'

RSpec.describe 'poin_events/new', type: :view do
  before(:each) do
    assign(:poin_event, PoinEvent.new(
                          user_id: 1,
                          balance: 1,
                          description: 'MyString',
                          admin_award_id: 1,
                          hours_attend: 1.5
                        ))
  end

  it 'renders new poin_event form' do
    render

    assert_select 'form[action=?][method=?]', poin_events_path, 'post' do
      assert_select 'input[name=?]', 'poin_event[user_id]'

      assert_select 'input[name=?]', 'poin_event[balance]'

      assert_select 'input[name=?]', 'poin_event[description]'

      assert_select 'input[name=?]', 'poin_event[admin_award_id]'

      assert_select 'input[name=?]', 'poin_event[hours_attend]'
    end
  end
end
