class LoginController < ApplicationController

    # POST /login
    def auth_user
        user = User.find_by(email: params[:email])
        if user = User.authenticate(params[:email], params[:password])
            render json: payload(user)
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
