module Articles::RollbackService
  extend self

  def call(article, params)
    version = article.versions.by_item_id(params[:version_id])
    if version.event == "create"
      version = article.paper_trail.version_at(version.created_at)
      version.save
    else
      version.reify.save
    end
  end
end
