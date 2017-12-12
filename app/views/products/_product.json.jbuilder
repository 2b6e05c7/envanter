json.extract! product, :id, :name, :template_id, :company, :properties, :year, :warranty, :status, :created_at, :updated_at
json.url product_url(product, format: :json)
