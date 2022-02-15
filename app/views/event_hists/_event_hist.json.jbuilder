json.extract! event_hist, :id, :event_id, :user_id, :sign_in, :point_recv, :created_at, :updated_at
json.url event_hist_url(event_hist, format: :json)
