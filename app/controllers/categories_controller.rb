class CategoriesController < ApplicationController
      
      def index
        @categories = current_user.categories 
      end 
  
      def create
        Category.create(category_params)
      end

      def show
        @category = Category.find_by(id: params[:id])
      end 
     
      private
     
      def category_params
        params.require(:category).permit(:name, routine_ids: [])
      end

end