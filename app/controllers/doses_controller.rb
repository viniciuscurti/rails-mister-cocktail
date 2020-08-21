  
class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    # se salvarmos no bd
    if @dose.save
      # mando ele para o show
      redirect_to cocktail_path(@cocktail.id)
    else
      # senao, mostro o form do new de novo pro user arrumar
      # o que fez de errado
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end


  private

  # receita de bolo
  # filtra quais são os campos que podemos deixar passar para
  # a criacao de uma dose
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end