json.extract! post, :id, :title, :body, :adres, :created_at, :updated_at
json.url post_url(post, format: :json)
