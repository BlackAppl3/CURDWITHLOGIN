class InformationController < ApplicationController

    before_action :require_login
    before_action :set_cache_buster

    def index
      @info = Information.all
    end
    
    def new
      @info = Information.new
    end

    def create
      @info = Information.new(information_params)
      if @info.save
         redirect_to information_index_path
      else
           flash[:errors] = @info.errors.full_messages
           redirect_to '/information/new'
      end  
    end

    def edit
        @info = Information.find(params[:id])
    end

    def update
        @info = Information.find(params[:id])
        if @info.update(information_params)
            redirect_to information_index_path
        end
    end

    def information_params
        params.require(:information).permit(:name, :age)
    end

    def show
        @info = Information.find(params[:id])
    end

    def delete
        @info = Information.find(params[:id])
        @info.destroy
        redirect_to information_index_path
    end

end