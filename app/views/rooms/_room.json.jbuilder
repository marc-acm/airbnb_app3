json.extract! room, :id, :name, :description, :location, :rating_id, :host, :created_at, :updated_at
json.url room_url(room, format: :json)
