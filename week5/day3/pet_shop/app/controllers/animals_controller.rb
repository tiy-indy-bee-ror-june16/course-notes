class AnimalsController < ApplicationController

  def index
    if params[:breed_id]
      @breed = Breed.find(params[:breed_id])
      @animals = @breed.animals.all
    else
      @animals = Animal.order(created_at: :desc)
    end
  end

  def show
    if params[:breed_id]
      @breed = Breed.find(params[:breed_id])
      @animal = @breed.animals.find(params[:id])
    else
      @animal = Animal.find(params[:id])
    end
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to @animal
    else
      render :new
    end
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to @animal
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    redirect_to root_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :temperment, :breed_id)
  end

end
