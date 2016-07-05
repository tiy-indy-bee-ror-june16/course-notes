class VisitorsController < ApplicationController

  def index
    #redirect_to "https://google.com?hi_there=true"
    render text: "Hello world!"
  end

  def name
    render text: "The visitor is #{params[:id]}"
  end

  def time
    if params[:days_ago].to_i > 6
      render text: 'We can\'t go back that far.'
    else
      render text: params[:days_ago].to_i.days.ago
    end
  end

end
