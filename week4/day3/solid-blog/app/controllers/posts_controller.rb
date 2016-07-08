class PostsController < ApplicationController

  def index
    set_page_title
    @posts = Thing.all.sort_by{|thing| thing.created_at}.reverse
  end

  def show
    @post = Thing.all.detect{|thing| thing.id == params[:id].to_i}
    set_page_title
    Rails.logger.info @page_title.inspect
  end

  def archive
    @posts = Thing.all
    set_page_title
  end

end
