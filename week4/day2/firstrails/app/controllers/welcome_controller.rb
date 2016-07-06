class WelcomeController < ApplicationController

  def index
    @title = "Howdy ya'll"
    @lipsums = %w(standard samuel hipster)
    #render locals: {title: our_title}
  end

  def show
    @title = params[:name].titleize
    @lipsums = %w(standard samuel hipster)
    render :index
  end

  def lipsum
    @title = "Your Lipsum"
    @this_lipsum = case params[:this_type]
    when "standard"
      "drh ft tf jftt jfyg njy ygnf gnyfg"
    when "hipster"
      "drgxdsgyj drhsrht trjrdytjtr ftjtyjt"
    when "samuel"
      "ewtyr tuytrjr ukityukut utl9yiulkuiy"
    end
    unless @this_lipsum
      render template: 'welcome/improper'
    end
  end

end
