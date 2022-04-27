json.extract!(point, :id, :name, :point_type, :val, :desc, :created_at, :updated_at)
json.url(point_url(point, format: :json))
