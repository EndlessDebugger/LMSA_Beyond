json.extract! user, :id, :user_id, :major, :admin, :email, :first_name, :last_name, :created_at, :updated_at
json.url user_url(user, format: :json)
