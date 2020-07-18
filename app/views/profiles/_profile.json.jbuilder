json.extract! profile, :id, :screenname, :city, :birthday, :created_at, :updated_at
json.url profile_url(profile, format: :json)
