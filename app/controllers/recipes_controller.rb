class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    # @recipes = @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients_ids => [], ingredients_attributes: [:name])
  end
end
