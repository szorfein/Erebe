class HomemsgsController < ApplicationController
  before_action :set_homemsg, only: [:show, :update, :destroy]

  # GET /homemsgs
  def index
    @homemsgs = Homemsg.all

    render json: @homemsgs
  end

  # GET /homemsgs/1
  def show
    render json: @homemsg
  end

  # POST /homemsgs
  def create
    @homemsg = Homemsg.new(homemsg_params)

    if @homemsg.save
      render json: @homemsg, status: :created, location: @homemsg
    else
      render json: @homemsg.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /homemsgs/1
  def update
    if @homemsg.update(homemsg_params)
      render json: @homemsg
    else
      render json: @homemsg.errors, status: :unprocessable_entity
    end
  end

  # DELETE /homemsgs/1
  def destroy
    @homemsg.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_homemsg
      @homemsg = Homemsg.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def homemsg_params
      params.require(:homemsg).permit(:instance, :title, :message, :created_at, :class_page)
    end
end
