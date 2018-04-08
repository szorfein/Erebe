class UsersController < ApplicationController
    include Secured

    before_action :set_user, only: [:update, :destroy]
    before_action :set_auth, only: [:create]
    skip_before_action :authenticate_request!, only: [:create, :index]

    # Get /users
    def index
        @users = User.all

        render json: @users
    end

    # POST /users
    def create
        @user = User.new(user_params)
        @user[:auth] = @auth[:id]

        if @user.save!
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /users/1
    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    # DELETE /users/1
    def destroy
        @user.destroy
        render json: { message: 'user has been remove' }
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    def set_auth
        checkToken!
    end

    def checkToken!
        @token = user_params[:token]
        tokenLength = @token.length
        if @token == nil || tokenLength != 24
            render json: { errors: ['Bad token parameter'] },
                status: :unauthorized
        else
            @auth = Auth.find_by(token: @token)
        end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :token)
    end
end
