json.extract! server, :id, :name, :host, :port, :auth_token, :created_at, :updated_at
json.url server_url(server, format: :json)