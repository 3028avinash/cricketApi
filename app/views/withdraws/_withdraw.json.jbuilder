json.extract! withdraw, :id, :account_id, :coin, :txn_in, :coin_amount, :created_at, :updated_at
json.url withdraw_url(withdraw, format: :json)
