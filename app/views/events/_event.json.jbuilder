json.extract! event, :id, :event_name, :e_type, :event_date, :signin_time, :description, :event_creator, :virtual,
              :password, :meeting_link, :point_val, :graphics, :total_event_hr, :created_at, :updated_at
json.url event_url(event, format: :json)
