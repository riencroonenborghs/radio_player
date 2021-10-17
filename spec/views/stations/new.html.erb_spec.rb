require 'rails_helper'

RSpec.describe "stations/new", type: :view do
  before(:each) do
    assign(:station, Station.new(
      name: "MyString",
      website: "MyString",
      stream_url: "MyString",
      description: "MyText"
    ))
  end

  it "renders new station form" do
    render

    assert_select "form[action=?][method=?]", stations_path, "post" do

      assert_select "input[name=?]", "station[name]"

      assert_select "input[name=?]", "station[website]"

      assert_select "input[name=?]", "station[stream_url]"

      assert_select "textarea[name=?]", "station[description]"
    end
  end
end
