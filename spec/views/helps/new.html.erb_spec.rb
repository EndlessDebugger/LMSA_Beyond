require 'rails_helper'

RSpec.describe "helps/new", type: :view do
  before(:each) do
    assign(:help, Help.new())
  end

  it "renders new help form" do
    render

    assert_select "form[action=?][method=?]", helps_path, "post" do
    end
  end
end
