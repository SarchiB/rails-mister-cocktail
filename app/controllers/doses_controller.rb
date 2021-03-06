class DosesController < ApplicationController
  before_action :set_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
    @ingredient = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # do the sme logic  to this
    # @dose.ingredient =
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end

