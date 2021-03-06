class UsersController < ApplicationController
    def index
        @user = User.new
    end

    def create
        user = User.new(user_params) #user is the model name
        if user.save
           session[:user_id] = user.id
        #    flash[:errors] = ["Account successfully created"]
           redirect_to information_index_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to root_path
        end
    end

private
    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
        # params.requre(modelname)
    end

end