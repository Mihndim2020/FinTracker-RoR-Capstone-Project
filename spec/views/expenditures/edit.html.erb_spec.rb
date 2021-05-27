require 'rails_helper'

RSpec.describe "expenditures/edit", type: :view do
  before(:each) do
    @expenditure = assign(:expenditure, Expenditure.create!(
      name: "MyString",
      author_id: 1,
      group_id: 1,
      amount: 1
    ))
  end

  it "renders the edit expenditure form" do
    render

    assert_select "form[action=?][method=?]", expenditure_path(@expenditure), "post" do

      assert_select "input[name=?]", "expenditure[name]"

      assert_select "input[name=?]", "expenditure[author_id]"

      assert_select "input[name=?]", "expenditure[group_id]"

      assert_select "input[name=?]", "expenditure[amount]"
    end
  end
end
