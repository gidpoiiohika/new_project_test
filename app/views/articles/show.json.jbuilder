json.id @article.id
json.title @article.title
json.description @article.description
json.status @article.status
json.created_at @article.created_at
json.updated_at @article.updated_at
json.deleted_at @article.deleted_at

author = @article.author
json.author do
  json.id author.id
  json.email author.email
  json.first_name author.first_name
  json.last_name author.last_name
  json.role author.role
  json.status author.status
end

category = @article.category
json.category do
  json.id category.id
  json.name category.name
end


comments = @article.comments.sort_comment
json.comments comments.each do |field|
  author = field.user

  json.id field.id
  json.title field.title
  json.rating field.rating
  json.author do
    json.id author.id
    json.email author.email
    json.first_name author.first_name
    json.last_name author.last_name
    json.role author.role
    json.status author.status
  end
end

tags = @article.tags
json.tags tags.each do |field|
  json.id field.id
  json.name field.name
end
