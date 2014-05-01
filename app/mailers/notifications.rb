class Notifications < ActionMailer::Base

    default from: "from@example.com"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.notifications.welcome.subject

    def welcome(user)
        @user = user
        mail to: @user.email, subject: "Welcome to Plannr!"
    end

    def password_reset(token)
        @user = User.find_by(token: token)
        mail to: @user.email, subject: "Plannr Password Reset."
    end

    def contact_by(form)
        @form_data = form
        mail to: "hello@yourplannr.com", subject: "[Contact Form]", from: @form_data["email"]
    end

end
