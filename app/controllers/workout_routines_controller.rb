class WorkoutRoutinesController < ApplicationController
    
    def index
        @workout_routines - WorkoutRoutine.all 
    end 

    def show 

    end 
end
