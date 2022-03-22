require 'rails_helper'

RSpec.describe "helps/edit", type: :view do
  before(:each) do
    @help = assign(:help, Help.create!())
  end

  it "renders the edit help form" do
    render

    assert_select "form[action=?][method=?]", help_path(@help), "post" do
    end
  end
end
