json.extract!(announcement, :id, :created_at, :updated_at, :link)
json.url(announcement_url(announcement, format: :json))
