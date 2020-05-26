class TeamsController < ApplicationController

    def index 
       
        @teams = Team.all

    end

    def show 
        @team = Team.find_by(id:params[:id])
  
        if @team
            render "show"
        else
            redirect_to teams_path
        end
       
    end

    def new 
        @team = Team.new
        3.times { @team.landscapes.build }
        
    end

    def create
        @team = Team.new(team_params)
        if @team.save
            redirect_to @team
        else
            render "new"
        end
    end

    def edit
        @team = Team.find_by(id:params[:id])
        if @team
            render 'edit'
        else
            redirect_to teams_path
        end
    end

    def update
        @team =  Team.find_by(id:params[:id])
        if @team
            @team.update(team_params)
            if @team.errors.any?
                render "edit"
            else
                redirect_to @team
            end
        else
            render "edit"
        end
      
    end

    def destroy
        @team = Team.find_by(id:params[:id])
        @team.destroy
        redirect_to teams_path
    end

    private


    def team_params
        params.require(:team).permit(:name, :id, :landscape_id, :user_id, landscapes_attributes:[:id, :address, :area, :user_id])
    end
end
