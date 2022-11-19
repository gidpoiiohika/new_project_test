# frozen_string_literal: true

json.articles @articles.each do |field|
  json.id field.id
  json.title field.title
  json.description field.description
  json.status field.status
  json.author_id field.author_id
  json.category_id field.category_id
  json.created_at field.created_at
  json.updated_at field.updated_at
  json.deleted_at field.deleted_at
end
