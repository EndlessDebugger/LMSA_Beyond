json.array!(@events) do |event|   
  json.title event.event_name  
  json.start event.event_date   
  json.end (event.event_date.to_time + event.total_event_hr.hours).to_datetime 
  json.url event_url(event) 
end
