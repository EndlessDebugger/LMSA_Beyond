json.extract! event, :id, :event_name, :event_type, :start_time, :end_time, :description, :event_creator, :virtual,
              :password, :meeting_link, :point_val, :graphics, :total_event_hr, :created_at, :updated_at, :categories
json.url event_url(event, format: :json)
