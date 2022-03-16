require 'rails_helper'

RSpec.describe "helps/show", type: :view do
  before(:each) do
    @help = assign(:help, Help.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
