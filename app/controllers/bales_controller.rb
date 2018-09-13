class BalesController < ApplicationController
  def index
    render json: Bale.all
  end

  def create
    bale = Bale.new(bale_params)
    if bale.save
      render json: bale
    else
      render json: bale.errors, status: :bad_request
    end
  end

  def show
    render json: bale_by_id
  end

  private

  def bale_by_id
    @bale_by_id ||= Bale.find(params[:id])
  end

  def bale_params
    params.require(:bale).permit(:weight, :material)
  end
end
