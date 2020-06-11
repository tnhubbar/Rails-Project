class ExercisesController < ApplicationController
    
    def index 
        if params[:routine_id]
            @exercises = Routine.find(params[:routine_id]).exercises
        else 
           @exercises = current_user.routines.map {|r| r.exercises }.flatten 
        end  
    end 
    
    def new  
        @exercise = Exercise.new    
    end 

    def create 
        @exercise = Exercise.new(name: params[:name])
    end 

    def show 
        @exercise = Exercise.find_by_id(params[:id])
    end 


    
end
