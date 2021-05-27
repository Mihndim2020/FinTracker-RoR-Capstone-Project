require 'rails_helper'

RSpec.describe "expenditures/show", type: :view do
  before(:each) do
    @expenditure = assign(:expenditure, Expenditure.create!(
      name: "Name",
      author_id: 2,
      group_id: 3,
      amount: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
