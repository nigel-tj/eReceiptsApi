class Api::V1::ReceiptItemController < ApplicationController
  respond_to :json
  def create
    receit_item = ReceiptItem.new(receipt_item_params)
    if receit_item.save
      render json: receit_item, status: 201, location: [:api, receit_item]
    else
      render json: { errors: receipt_item.errors }, status: 422
    end
  end

  private
  
  def receipt_item_params
    params.require(:receipt_item).permit(:name, :value, :receipt_id)
  end
end
