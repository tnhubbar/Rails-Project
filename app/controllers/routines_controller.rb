class RoutinesController < ApplicationController
    helper_method :params
    before_action :require_logged_in
     
    
    def index
        @categories = Category.all 
        if !params[:category_id].blank?
            @routines = Routine.all.by_category(params[:category_id]) 
        elsif params[:routine] && !params[:routine][:duration].blank?
            @routines = Routine.by_duration(params[:routine][:duration])
        elsif params[:name]
            @routines = Routine.where('name LIKE ?', "%#{params[:name]}%")
        else 
        @routines = Routine.all 
        end  
    end 
   
    def new
        @routine = Routine.new
        @routine.exercises.build
        @routine.exercises.build
        @routine.exercises.build
        @routine.build_category

    end 

    def create 
        @routine = current_user.routines.build(routine_params)
        if @routine.save
        redirect_to routine_path(@routine)
        else 
            render :new 
        end 
    end 

    def edit 
        set_routine 
        nonowner
    end 

    def update
        set_routine 
        nonowner
    
        @routine.update(routine_params)
    
        if @routine.save
          redirect_to @routine
        else
          render :edit
        end
      end

      def destroy
       set_routine 
       nonowner
        @routine.destroy
        flash[:notice] = "Workout Routine deleted." 
        redirect_to routines_path
      end
    

    def show 
        set_routine 
    end 
    
    def self.search(search_name)
        search_name = "%" + name + "%"
        self.where("name LIKE ?", search_name)
    end 

    private 

    def routine_params
        params.require(:routine).permit(:name, :searched_name, :duration, :description, category_attributes: [:name, :id], exercises_attributes: [:name, :id])
    end 

    def set_routine
        @routine = Routine.find_by(id: params[:id])
    end 
    
    def nonowner
        if current_user != @routine.user 
            redirect_to '/'
            flash[:notice] =  "You aren't the owner my friend, you cannot modify."
        end 
         
    end 
end
