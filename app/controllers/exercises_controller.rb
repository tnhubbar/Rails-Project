class ExercisesController < ApplicationController
    before_action :require_logged_in

    def index 
        if params[:routine_id]
            @exercises = Routine.find(params[:routine_id]).exercises
        else 
           #@exercises = current_user.routines.map {|r| r.exercises }.flatten 
           @exercises = current_user.exercises 
        end  
    end 
    
    def new  
        @exercise = Exercise.new(routine_id: params[:routine_id]) 
    end 

    def create 
        @exercise = Exercise.new(exercise_params)
        if @exercise.save 
        redirect_to exercise_path(@exercise)    
        else
       render :new
        end 
    end 

    def show 
        @exercise = Exercise.find_by_id(params[:id])
    end 

    def destroy
        @exercise = Exercise.find(params[:id])
        nonowner
        @exercise.destroy
        flash[:notice] = "Exercise has been deleted." 
        redirect_to user_path(current_user.id)
      end

    private 

    def exercise_params 
        params.require(:exercise).permit(:name, :routine_id)
    end 
    def nonowner
        if current_user != @exercise.routine.user 
            redirect_to '/'
            flash[:notice] =  "You aren't the owner my friend, you cannot modify."
        end 
         
    end 

    
end
