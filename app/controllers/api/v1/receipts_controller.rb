class Api::V1::ReceiptsController < ApplicationController
  #before_action only: [:create, :update, :destroy]
  respond_to :json

  def index
    #respond_with Receipt.all  
  end

  def receipt
    receipt = Receipt.where(:receipt_number => params[:receipt_id])
    if receipt
      render json: receipt , status: 201, location: [:api, receipt], include: :receipt_items, except: [:updated_at,:receipt_id,:id,:receipt_id_id]  
    else
      render json: { errors: receipt.errors }, status: 422
    end
  end

  def receipts
    @receipts = Array.new
    @receipt_ids = params[:fetch_receipts]
   
    @receipt_ids.each do |receipt_id|
      receipt = Receipt.where(:receipt_number => receipt_id)
      @receipts = {receipt_id => receipt.to_json} 
    end
    
    render json: @receipts , status: 201
    
  end

  def create
    receipt = Receipt.new(receipt_params)
    
    if receipt.save
      render json: receipt , status: 201, location: [:api, receipt], include: :receipt_items, except: [:updated_at,:receipt_id,:id,:receipt_id_id] 
    else
      render json: { errors: receipt.errors }, status: 422
    end
  end

  def daily_summary

  end

  def monthly_summary

  end

  def destroy
    receipt = current_user.receipts.find_by_id(params[:id]) 
    receipt.destroy
    head 204
  end

  private

    def receipt_params
      params.permit(:token,:receipt_number, :header, :footer, {:receipt_items_attributes => [:name, :value]}, {:fetch_receipts_attributes => [:receipt_number]}) 
    end

end
