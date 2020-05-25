class LandscapesController < ApplicationController

    def index 
        @landscapes = Landscape.all
    end

    def show 
        @landscape = Landscape.find_by(id:params[:id])
        
        if @landscape
            render "show"
        else
            redirect_to landscapes_path
        end
       
    end

    def new 
        @landscape = Landscape.new
    end

    def create
        @landscape = Landscape.new(landscape_params)
        if @landscape.save
            redirect_to @landscape
        else
            render "new"
        end
    end

    def edit
        @landscape = Landscape.find_by(id:params[:id])
        if @landscape
            render 'edit'
        else
            redirect_to landscapes_path
        end
    end

    def update
        @landscape =  Landscape.find_by(id:params[:id])
        if @landscape
            @landscape.update(landscape_params)
            if @landscape.errors.any?
                render "edit"
            else
                redirect_to @landscape
            end
        else
            render "edit"
        end
      
    end

    def destroy
        @landscape = Landscape.find_by(id:params[:id])
        @landscape.destroy
        redirect_to landscapes_path
    end

    private


    def landscape_params
        params.require(:landscape).permit(:address, :id, :team_id, :area)
    end
end
