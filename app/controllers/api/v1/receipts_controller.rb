class Api::V1::ReceiptsController < ApplicationController
  before_action only: [:create, :update, :destroy]
  respond_to :json

  def index
    #respond_with Receipt.all  
  end

  def show
    #respond_with Receipt.find_by_user_id(params[:user_id])   
  end

  def create
    receipt = Receipt.new(receipt_params)
    receipt_items = params[:receipt_items_attributes]
    
    # receipt_items.each do |item|
    #   new_item = ReceiptItem.new()
    #   new_item.save
    # end

    if receipt.save
      render json: receipt, status: 201, location: [:api, receipt] 
    else
      render json: { errors: receipt.errors }, status: 422
    end
  end

  # def update
  #   receipt = receipts.find_by_id(params[:id])
  #   if receipt.update(receipt_params)
  #     render json: receipt, status: 200, location: [:api, receipt] 
  #   else
  #     render json: { errors: receipt.errors }, status: 422
  #   end
  # end

  def destroy
    receipt = current_user.receipts.find_by_id(params[:id]) 
    receipt.destroy
    head 204
  end

  private

    def receipt_params
      params.require(:receipt).permit(:user_id,:receipt_number, :header, :footer, :receipt_items_attributes) 
    end

end
