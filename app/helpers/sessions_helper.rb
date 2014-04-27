module SessionsHelper

    def signin(user)
        token = User.new_token
        session[:token] = token
        cookies.permanent[:token] = token
        user.update_attribute(:token, User.hash(token))
        self.current_user = user
    end

    def signed_in?
        !current_user.nil?
    end

    def signed_in_user
        unless signed_in?
            redirect_to login_url, notice: "Please login."
        end
    end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        token = User.hash(session[:token])
        @current_user ||= User.find_by(token: token)
    end

    def current_user?(user)
        user == current_user
    end

    def signout
        session[:token] = nil
        reset_session
        cookies.delete :token
    end

end
