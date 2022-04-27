json.extract!(point, :id, :name, :val, :desc, :created_at, :updated_at)
json.url(point_url(point, format: :json))
