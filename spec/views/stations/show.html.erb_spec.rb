require 'rails_helper'

RSpec.describe "stations/show", type: :view do
  before(:each) do
    @station = assign(:station, Station.create!(
      name: "Name",
      website: "Website",
      stream_url: "Stream Url",
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Stream Url/)
    expect(rendered).to match(/MyText/)
  end
end
