class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  
  def set_page_title
    @page_title = @post ? @post.title : "I'm a cheeky monkey"
  end

end
