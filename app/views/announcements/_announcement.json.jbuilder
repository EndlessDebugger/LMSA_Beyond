json.extract!(announcement, :id, :created_at, :updated_at, :link, :Rich_Description)
json.url(announcement_url(announcement, format: :json))
