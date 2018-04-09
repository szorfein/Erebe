module RenderJson
    extend ActiveSupport::Concern
    included do
    end
    def say 
        render json: { message: "#{encryptData}" }
    end
end
