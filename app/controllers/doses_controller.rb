class DosesController < ApplicationController
  before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(params["dose"][:ingredient])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
