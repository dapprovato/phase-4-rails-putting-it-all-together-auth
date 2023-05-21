class RecipesController < ApplicationController
    before_action :authorized

    def index
        recipes = Recipes.all
        render json: recipes, include: :user_id
    end

    def create
        recipe = Recipe.create(recipe_params)
        if recipe
            # byebug
            render json: recipe, status: :created
        else
            render json: { errors: recipe.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

end