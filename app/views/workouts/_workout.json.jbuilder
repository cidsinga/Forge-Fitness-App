json.extract! workout, :id, :date, :workout_type, :raw_notes, :created_at, :updated_at
json.url workout_url(workout, format: :json)
