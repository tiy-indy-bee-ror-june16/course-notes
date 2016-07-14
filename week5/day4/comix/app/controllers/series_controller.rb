class SeriesController < ApplicationController

  def index
    @serieses = Series.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @series = Series.find(params[:id])
  end

  def new
    @series = Series.new
  end

  def create
    @series = Series.new(series_params)
    if @series.save
      flash[:success] = "We've created #{@series.name}!"
      redirect_to root_path
    else
      flash[:warning] = "Please fix the errors below, jackhole."
      render :new
    end
  end

  def edit
    @series = Series.find(params[:id])
  end

  def update
    @series = Series.find(params[:id])
    if @series.update(series_params)
      flash[:success] = "We've updated #{@series.name} to your wishes."
      redirect_to root_path
    else
      flash[:warning] = "Please fix the errors below, jackass."
      render :edit
    end
  end

  private

  def series_params
    params.require(:series).permit(:name, :description, :year_start, :year_end, :publisher_id)
  end

end
