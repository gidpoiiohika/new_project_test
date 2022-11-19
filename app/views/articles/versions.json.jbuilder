json.versions @versions.each do |field|
  if field.event == "create"
    json.title Article.by_item_id(field.item_id).title
  else
    json.title field.reify(dup: true).title
  end
  json.event field.event
end
