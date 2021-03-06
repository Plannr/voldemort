class UsersController < ApplicationController

    before_action :signed_in_user, except: [:new, :create]
    before_action :set_user
    # before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    # GET /users.json
    def index
        set_body_class "dashboard"
        # @users = User.all
        # render @user.to_json
    end

    # GET /users/1
    # GET /users/1.json
    def show
        set_body_class "dashboard"
    end

    # GET /users/new
    def new
        set_body_class "tight-col"
        @user = User.new
    end

    # GET /users/1/edit
    def edit
        set_body_class "dashboard"
    end

    # POST /users
    # POST /users.json
    def create
        set_body_class "tight-col"
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                Notifications.welcome(@user).deliver
                signin(@user)
                format.html { redirect_to dashboard_url, notice: 'Your account was successfully created.' }
                format.json { render :show, status: :created, location: dashboard_url }
            else
                format.html { render :new }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
        set_body_class "dashboard"
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to edit_users_url, notice: 'Your account was successfully updated.' }
                format.json { render :show, status: :ok, location: edit_users_url }
            else
                format.html { render :edit }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        set_body_class "dashboard"
        @user.destroy
        respond_to do |format|
            format.html { redirect_to root_url }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            # @user = User.find(params[:id])
            @user = current_user
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
