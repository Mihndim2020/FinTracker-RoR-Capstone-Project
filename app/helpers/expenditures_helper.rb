module ExpendituresHelper
  def display_icon(group, expenditure)
    return unless expenditure.group

    image_tag group.icon, alt: 'group-icon', class: 'group-img'
  end

  def total_expenses(expenditures)
    expenditures.inject(0) { |sum, expenditure| sum + expenditure.amount }
  end
end
