class UsersController < ApplicationController
    include Secured

    before_action :set_user, only: [:update, :destroy]
    skip_before_action :authenticate_request!, only: [:create]

    # POST /users
    def create
        @user = User.new(user_params)

        if @user.save
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

    # Only allow a trusted parameter "white list" through.
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
