class SessionsController < ApplicationController

    before_action { set_body_class "tight-col" }

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
