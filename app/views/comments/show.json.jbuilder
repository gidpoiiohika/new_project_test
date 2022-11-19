# frozen_string_literal: true

json.id @comment.id
json.title @comment.title
json.rating @comment.rating
json.created_at @comment.created_at
json.updated_at @comment.updated_at

author = @comment.user
json.author do
  json.id author.id
  json.email author.email
  json.first_name author.first_name
  json.last_name author.last_name
  json.role author.role
  json.status author.status
end
