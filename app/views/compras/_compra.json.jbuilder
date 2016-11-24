json.extract! compra, :id, :user_id, :puntos, :precio, :created_at, :updated_at
json.url compra_url(compra, format: :json)