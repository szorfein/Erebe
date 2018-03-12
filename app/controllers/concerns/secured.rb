module Secured
    extend ActiveSupport::Concern

    #included do
    #    before_action :authenticate!
    #end

    private 

    def validate_token!
        begin
            TokenProvider.valid?(token)
        rescue
            render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        end
    end

    def authenticate!
        begin
            payload, header = TokenProvider.valid?(token)
            @current_user = User.find_by(id: payload['user_id'])
        rescue
            render json: { errors: ['Not Authenticated'] }, status: :unauthorized
        end
    end

    def current_user
        @current_user ||= authenticate!
    end

    def token
        if request.headers['Authorization'].present?
            request.headers['Authorization'].split(' ').last
        end
    end
end
