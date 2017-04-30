json.extract! document, :id, :title, :description, :active, :created_at, :updated_at
json.url document_url(document, format: :json)
