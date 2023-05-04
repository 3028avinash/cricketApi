json.extract! account, :id, :user_id, :coin, :redeemcode, :refer_code, :created_at, :updated_at
json.url account_url(account, format: :json)
