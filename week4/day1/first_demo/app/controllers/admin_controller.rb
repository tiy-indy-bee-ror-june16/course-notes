class AdminController < ApplicationController

  def administrate
    render text: "Admin #{params[:this] || "yourself"}!"
  end

end
