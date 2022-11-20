# frozen_string_literal: true

json.categories @categories.each do |field|
  json.id field.id
  json.name field.name
end
