require 'rails_helper'

RSpec.describe "expenditures/new", type: :view do
  before(:each) do
    assign(:expenditure, Expenditure.new(
      name: "MyString",
      author_id: 1,
      group_id: 1,
      amount: 1
    ))
  end

  it "renders new expenditure form" do
    render

    assert_select "form[action=?][method=?]", expenditures_path, "post" do

      assert_select "input[name=?]", "expenditure[name]"

      assert_select "input[name=?]", "expenditure[author_id]"

      assert_select "input[name=?]", "expenditure[group_id]"

      assert_select "input[name=?]", "expenditure[amount]"
    end
  end
end
