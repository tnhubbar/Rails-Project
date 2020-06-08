class RoutinesController < ApplicationController
    
    def index
        @routines - Routine.all 
    end 
   
    def new
        @routine = Routine.new
    end 

    def create
        binding.pry
        @routine = Routine.create(routine_params)
        if @routine.save
        redirect_to routine_path(@routine)
        else 
            render :new 
        end 
    end 

    def edit 
        @routine = Routine.find_by(id: params[:id])
    end 

    def update
        @routine = Routine.find(params[:id])
    
        @routine.update(routine_params)
    
        if @routine.save
          redirect_to @routine
        else
          render :edit
        end
      end

      def destroy
        @routine = Rountine.find(params[:id])
        @routine.destroy
        flash[:notice] = "Workout Routine deleted."
        redirect_to routines_path
      end
    

    def show 
        @routine = Routine.find_by(id: params[:id])
    end 

    def routine_params
        params.require(:routine).permit(:name, :duration, :description, categories_attributes: [:name], exercises_attributes: [:name])
    end 
end
