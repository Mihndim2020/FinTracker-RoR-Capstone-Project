class User < ApplicationRecord
  validates :name, presence: true, length: { in: 2..24 }, uniqueness: true
  has_one_attached :avatar
  has_many :groups, class_name: 'Group', foreign_key: 'user_id'
  has_many :expenditures, class_name: 'Expenditure', foreign_key: 'author_id'

  def ungrouped_expenditures_from_user(user_id)
    Expenditure.includes(:author).where(group_id: nil).where(author_id: user_id)
  end
end
