require 'rails_helper'

RSpec.describe "stations/index", type: :view do
  before(:each) do
    assign(:stations, [
      Station.create!(
        name: "Name",
        website: "Website",
        stream_url: "Stream Url",
        description: "MyText"
      ),
      Station.create!(
        name: "Name",
        website: "Website",
        stream_url: "Stream Url",
        description: "MyText"
      )
    ])
  end

  it "renders a list of stations" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Website".to_s, count: 2
    assert_select "tr>td", text: "Stream Url".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
