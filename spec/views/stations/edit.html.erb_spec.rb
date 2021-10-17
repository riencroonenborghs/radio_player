require 'rails_helper'

RSpec.describe "stations/edit", type: :view do
  before(:each) do
    @station = assign(:station, Station.create!(
      name: "MyString",
      website: "MyString",
      stream_url: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit station form" do
    render

    assert_select "form[action=?][method=?]", station_path(@station), "post" do

      assert_select "input[name=?]", "station[name]"

      assert_select "input[name=?]", "station[website]"

      assert_select "input[name=?]", "station[stream_url]"

      assert_select "textarea[name=?]", "station[description]"
    end
  end
end
