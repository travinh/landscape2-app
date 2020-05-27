class LandscapesController < ApplicationController

    
    def index 
        if params[:team_id]
            set_team
            @landscapes = @team.landscapes
        else
            @landscapes = Landscape.all
        end
    end



    def show 
        @landscape = Landscape.find_by_id(params[:id])
       
        if params[:team_id]
            set_team
        end 
    end

    def new 
        if params[:team_id]
            set_team
            @landscape = @team.landscapes.build
        else
            @landscape = Landscape.new
        end
        
    end

    def create
           
        if params[:team_id]
            set_team
            @landscape = @team.landscapes.build(landscape_params)
        else
            @landscape = Landscape.new(landscape_params)
        end

        if @landscape.save
            redirect_to @landscape
        else
            render "new"
        end
    end

    def edit
        
        if check_user_using_landscapeID
            
            @landscape = Landscape.find_by(id:params[:id])
            if @landscape
                render 'edit'
            else
                redirect_to landscapes_path
            end
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
        if check_user_using_landscapeID
            @landscape = Landscape.find_by(id:params[:id])
            @landscape.destroy
            redirect_to landscapes_path
        else
            redirect_to landscapes_path
        end
    end

    def search
    end

    # Search for what matches the Query
    # recive query & display matches
    # get
    def resolved
    
        # @landscapes = Landscape.all.find_all
        @landscapes = Landscape.all.find_all{|s| s.address.downcase.include?(params[:query].downcase)}
        # @landscapes.each do |s|
           
        #     if s.address.downcase.include?(params[:query].downcase)
        #         @landscape << s.address.downcase.include?(params[:query].downcase)
        #     end
        # end
    end





    private

    def set_team
        @team = Team.find_by_id(params[:team_id])
    end

    def landscape_params
        params.require(:landscape).permit(:address, :id, :team_id, :query,:user_id, :area, :team_id)
    end
end
