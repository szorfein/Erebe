class LoginController < ApplicationController
    def new
        @user = User.new
    end

    # POST /login
    def auth_user
        if @user = login(params[:email], params[:password])
            user_info = User.find(params[:email])
            render json: payload(user_info)
        else
            render json: { errors: ['Invalid username|password'] }, status: :unauthorized
        end
    end

    # POST /logout
    def destroy
        logout
        render json: { message: 'Successfully logout.' }
    end

    private

    def payload(user)
        return nil unless user and user.id
        {
            auth_token: TokenProvider.encode({ user_id: user.id }),
            user: { id: user.id, email: user.email}
        }
    end
end
