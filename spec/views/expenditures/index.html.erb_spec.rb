require 'rails_helper'

RSpec.describe "expenditures/index", type: :view do
  before(:each) do
    assign(:expenditures, [
      Expenditure.create!(
        name: "Name",
        author_id: 2,
        group_id: 3,
        amount: 4
      ),
      Expenditure.create!(
        name: "Name",
        author_id: 2,
        group_id: 3,
        amount: 4
      )
    ])
  end

  it "renders a list of expenditures" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
