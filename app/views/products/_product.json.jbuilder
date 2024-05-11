json.extract! product, :id, :name, :quantity, :purchase_link, :purchase_link_website_name, :account_id, :created_at, :updated_at
json.url product_url(product, format: :json)
