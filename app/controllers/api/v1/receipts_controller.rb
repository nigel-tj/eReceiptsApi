class Api::V1::ReceiptsController < ApplicationController
  respond_to :json

  def show
    respond_with Receipt.find_by_id(params[:id])
  end

end
