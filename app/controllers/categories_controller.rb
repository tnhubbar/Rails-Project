class CategoriesController < ApplicationController
      def create
        Category.create(category_params)
      end

      def show
        @category = Category.find([params[:id]])
      end 
     
      private
     
      def category_params
        params.require(:category).permit(:name, routine_ids: [])
      end

end