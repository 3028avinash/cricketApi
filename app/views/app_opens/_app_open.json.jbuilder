json.extract! app_open, :id, :user_id, :versionName, :versionCode, :location, :source_ip, :created_at, :updated_at
json.url app_open_url(app_open, format: :json)
