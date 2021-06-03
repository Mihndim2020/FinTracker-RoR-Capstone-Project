json.extract! expenditure, :id, :name, :author_id, :group_id, :amount, :created_at, :updated_at
json.url expenditure_url(expenditure, format: :json)
