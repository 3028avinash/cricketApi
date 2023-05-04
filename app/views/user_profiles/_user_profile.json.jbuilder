json.extract! user_profile, :id, :name, :email, :mobile, :birthDate, :location, :gender, :profile_pic, :occupation, :source_ip, :user_id, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
