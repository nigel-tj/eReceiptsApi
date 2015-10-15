class Api::V1::ReceiptsController < ApplicationController
  before_action only: [:create, :update, :destroy]
  respond_to :json

  def index
    #respond_with Receipt.all  
  end

  def receipt
    receipt = Receipt.where(:token => params[:token],:receipt_number => params[:receipt_id]).first
    if receipt
      render json: receipt , status: 201, location: [:api, receipt], include: :receipt_items, except: [:updated_at,:receipt_id,:id,:receipt_id_id]  
    else
      render json: { errors: receipt.errors }, status: 422
    end
  end

  def receipts
    #receipts = Receipt.where(:token => params[:token]).all
    #render json: receipts , status: 201, location: [:api, receipts], include: :receipt_items, except: [:updated_at,:receipt_id,:id,:receipt_id_id]  
  end
  def create
    receipt = Receipt.new(receipt_params)
    
    if receipt.save
      render json: receipt , status: 201, location: [:api, receipt], include: :receipt_items, except: [:updated_at,:receipt_id,:id,:receipt_id_id] 
    else
      render json: { errors: receipt.errors }, status: 422
    end
  end

  def destroy
    receipt = current_user.receipts.find_by_id(params[:id]) 
    receipt.destroy
    head 204
  end

  private

    def receipt_params
      params.require(:receipt).permit(:token,:receipt_number, :header, :footer, {:receipt_items_attributes => [:name, :value]}) 
    end

end
