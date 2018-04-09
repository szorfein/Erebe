class HomeController < ApplicationController
    include RenderJson
    def index
        render json: { message: 'Hallo Nyx' }
    end

    def show
        param = params[:id]
        if (param == '1')
            puts( 'param 1' )
            say
        elsif (param == '2')
            puts( 'param 2' )
        else
            render json: { error: "cant process" }, status: 404
        end
    end

    private 
    def encryptData
        chiffred = Encryptor.encrypt
        puts("will work on #{chiffred}")
        return chiffred
    end
end
