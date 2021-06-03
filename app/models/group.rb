class Group < ApplicationRecord
  validates :name, presence: true, length: { in: 2..32 }

  belongs_to :user, class_name: 'User'
  has_many :expenditures
  has_one_attached :icon

  default_scope -> { order(name: :asc) }
end
