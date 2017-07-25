# this generates a JSON array as the main element
json.array! @items do |item|
  json.id item.id

  json.title item.title
  json.created_at item.created_at
  json.url api_v1_item_url(item)
end
