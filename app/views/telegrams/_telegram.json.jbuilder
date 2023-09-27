json.extract! telegram, :id, :name, :description, :url, :avatar, :cover, :created_at, :updated_at
json.url telegram_url(telegram, format: :json)
