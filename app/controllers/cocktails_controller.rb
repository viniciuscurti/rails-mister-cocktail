class CocktailsController < ApplicationController
    # FILTER (Execute set_cocktail method)
    before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

    # READ ALL (GET) /cocktails
    def index
      @cocktails = Cocktail.all
    end
  
    # READ ONE (GET) /cocktails/:id
    def show
    end
  
    # CREATE (GET) /cocktails/new
    def new
      @cocktail = Cocktail.new
    end
  
    # CREATE (POST) /cocktails
    def create
      @cocktail = Cocktail.new(cocktail_params)
      @cocktail.save
      redirect_to cocktail_path(@cocktail)
    end
  
    # EDIT (GET) /cocktails/:id/edit
    def edit
    end
  
    # EDIT (PATCH) /cocktails/:id
    def update
      @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    end
  
    # DESTROY (DELETE) /cocktails/:id
    def destroy
      @cocktail.destroy
      redirect_to @cocktails_path
    end
  
    private
  
    # STRONG PARAMS
    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
  
    # BEFORE ACTION FILTER
    def set_cocktail
      @cocktail = cocktail.find(params[:id])
    end
end
