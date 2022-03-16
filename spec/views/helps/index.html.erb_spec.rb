require 'rails_helper'

RSpec.describe "helps/index", type: :view do
  before(:each) do
    assign(:helps, [
      Help.create!(),
      Help.create!()
    ])
  end

  it "renders a list of helps" do
    render
  end
end
