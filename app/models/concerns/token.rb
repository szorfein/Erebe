module Token

    def removeToken
        self.token = true
    end

    def checkToken(token)
        @token = token
        tokenLength = @token.length
        if @token == nil || tokenLength != 24
            render json: { errors: ['Bad token parameter'] },
                status: :unauthorized
        else
            @auth = Auth.find_by(token: @token)
        end
    end
end
