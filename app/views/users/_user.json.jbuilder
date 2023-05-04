json.extract! user, :id, :deviceId, :deviceType, :deviceName, :socialType, :socialId, :socialToken, :socialEmail, :socialName, :socialmgUrl, :advertisingId, :versionName, :versionCode, :utmSource, :utmMedium, :utmTerm, :utmContent, :utmCampaign, :created_at, :updated_at
json.url user_url(user, format: :json)
