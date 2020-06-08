class RoutinesController < ApplicationController
    
    def new
        @routine = Routine.new
    end 
    
    def index
        @routines - Routine.all 
    end 

    def show 

    end 
end
