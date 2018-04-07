class AuthsController < ApplicationController
  before_action :set_auth, only: [:show, :update, :destroy]

  # GET /auths
  def index
    @auths = Auth.all

    render json: @auths
  end

  # GET /auths/1
  def show
    render json: @auth
  end

  # POST /auths
  def create
      authCount = Auth.all.count
      isPrimal = false
      ip_addr = request.remote_ip
      @auth = Auth.new(auth_params)

      if ( authCount == 0 ) 
          isPrimal = true
      end

      @auth[:created_at] = Time.now
      @auth[:token] = SecureRandom.base58(24)
      @auth[:ip_addr] = ip_addr
      @auth[:isPrimalInstance] = isPrimal

      if @auth.save
          render json: @auth, status: :created, location: @auth
      else
          render json: @auth.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /auths/1
  def update
    if @auth.update(auth_params)
      render json: @auth
    else
      render json: @auth.errors, status: :unprocessable_entity
    end
  end

  # DELETE /auths/1
  def destroy
    @auth.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth
      @auth = Auth.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def auth_params
      params.require(:auth).permit(:domain, :rootmail, :firstname, :lastname)
    end
end
