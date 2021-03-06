class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    redirect_to root_path if @cocktail.destroy
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :photo)
  end
end
