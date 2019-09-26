class DosesController < ApplicationController
  before_action :find_info, only: [:new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_strong_params)
    @dose.cocktail = @cocktail
    @dose.ingredient_id = params[:dose][:ingredient_id]

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      redirect_to cocktail_path(@cocktail)
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def find_info
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
