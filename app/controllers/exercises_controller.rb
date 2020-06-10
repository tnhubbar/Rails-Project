class ExercisesController < ApplicationController
    
    def index
        if params[:routine_id]
            @exercises = Routine.find(params[:routine_id]).exercises 
        else 
            @exercises = Exercises.all 
        end  
    end 
    
    def new 
    end 

    def show 
        @exercise = Exercises.find_by_id(params[:id])
    end 

    
end
