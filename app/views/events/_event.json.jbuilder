json.extract! event, :id, :event_id, :event_name, :event_type, :event_date, :description, :event_creator, :virtual, :password, :meeting_link, :signin_time, :point_val, :graphics, :total_event_hr, :created_at, :updated_at
json.url event_url(event, format: :json)
