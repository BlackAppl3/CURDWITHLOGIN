class SessionsController < ApplicationController
    def create
        # fail
        user = User.find_by(email: params[:email])
        if user && user.password_digest == params[:password_digest]
            session[:user_id] = user.id 
            redirect_to information_index_path
        else 
            flash[:errors] = ["Invalid Combination", "Try back later!!!"]
            redirect_back fallback_location: users_path
        end
    end

    def destroy
        reset_session
        redirect_to root_path
    end

end