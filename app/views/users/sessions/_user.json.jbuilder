json.extract! user, :id, :first_name, :major, :bio, :birthdate, :major
json.url referral_url(user, format: :json)
