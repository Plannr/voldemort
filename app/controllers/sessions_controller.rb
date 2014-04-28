class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            flash[:notice] = "Welcome, #{user.email}."
            signin(user)
            redirect_to dashboard_url
        else
            flash.now[:error] = "Invalid email/password combination."
            render "new"
        end
    end

    def destroy
        flash[:notice] = "You have succesfully logged out."
        signout
        redirect_to root_url
    end

end
