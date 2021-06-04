module ExpendituresHelper
  def display_icon(group, expenditure)
    if expenditure.group
      image_tag group.icon, alt: 'group-icon', class: 'group-img'
    else
      icon_url_for_group(group)
    end
  end

  def total_expenses(expenditures)
    expenditures.inject(0) { |sum, expenditure| sum + expenditure.amount }
  end
end
