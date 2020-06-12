class DosesController < ApplicationController

  def new 
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

    def create
        @dose = Dose.new(dose_params)
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose.cocktail = @cocktail
        if @dose.save
          redirect_to cocktail_path(@cocktail)
        else
          render :new 
        end
    end
    
#recuperer le cocktail pour pouvoir rediriger avant de detruire la dose 

def destroy

    id = params[:id]
    @dose = Dose.find(id)
    @cocktail = @dose.cocktail

    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
      def dose_params
        params.require(:dose).permit(:description,:ingredient_id)
      end
end
