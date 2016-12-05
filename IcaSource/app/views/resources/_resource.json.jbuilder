json.extract! resource, :id, :title, :text_content, :created_at, :updated_at
json.url resource_url(resource, format: :json)