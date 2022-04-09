json.extract! user, :id, :major, :bio, :birthdate
json.url user_url(user, format: :json)
