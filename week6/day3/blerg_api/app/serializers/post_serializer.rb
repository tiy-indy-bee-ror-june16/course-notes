class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :title, :body, :published, :show_link

  belongs_to :author
  has_many :tags

  def show_link
    post_path(object)
  end

end
