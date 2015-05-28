require 'spec_helper'

describe Api::V1::ReceiptsController do

  describe "GET #show" do
    before(:each) do 
      @user = FactoryGirl.create :user
      @receipt = FactoryGirl.create :receipt, user_id: @user.id
      get :show, id: @receipt.id, user_id: @user.id 
    end

    it "returns the information about a reporter on a hash" do
      receipt_response = json_response
      expect(receipt_response[:id]).to eql @receipt.id
    end

    it { should respond_with 200 }
  end

  # describe "GET #index" do
  #   before(:each) do
  #     @user = FactoryGirl.create :user
  #     4.times { FactoryGirl.create :receipt, user_id: @user.id } 
  #     get :index
  #   end

  #   it "returns 4 records from the database" do
  #     receipts_response = json_response
  #     expect(receipts_response[:receipts]).to have(4).items
  #   end

  #   it { should respond_with 200 }
  # end

  describe "POST #create" do
    context "when is successfully created" do
      before(:each) do
        @user = FactoryGirl.create :user
        @receipt_attributes = FactoryGirl.attributes_for :receipt
        api_authorization_header @user.auth_token 
        post :create, { user_id: @user.id, receipt: @receipt_attributes }
      end

      it "renders the json representation for the receipt record just created" do
        logger.debug "New receipt: #{@receipt_attributes.inspect}"
        receipt_response = json_response
        expect(receipt_response[:id]).to eql @receipt_attributes[:id]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @user = FactoryGirl.create :user 
        @invalid_receipt_attributes = { footer: "tejdfk", receipt_number: "Twelve dollars" } #notice I'm not including the email
        api_authorization_header @user.auth_token 
        post :create, { user_id: @user.id, receipt: @invalid_receipt_attributes }
      end

      it "renders an errors json" do
        receipt_response = json_response
        expect(receipt_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        receipt_response = json_response
        expect(receipt_response[:errors][:receipt_number]).to include "is not a number"
      end
      it { should respond_with 422 }
    end
  end

  # describe "PUT/PATCH #update" do
  #   before(:each) do
  #     @user = FactoryGirl.create :user
  #     @receipt = FactoryGirl.create :receipt, user_id: @user.id
  #     api_authorization_header @user.auth_token 
  #   end

  #   context "when is successfully updated" do
  #     before(:each) do
  #       patch :update, { user_id: @user.id, id: @receipt.id, receipt: { receipt_nuber: 22113300 } }
  #     end

  #     it "renders the json representation for the updated user" do
  #       receipt_response = json_response
  #       expect(receipt_response[:receipt_number]).to eql 22113300
  #     end

  #     it { should respond_with 200 }
  #   end

  #   context "when is not updated" do
  #     before(:each) do
  #       patch :update, { user_id: @user.id, id: @receipt.id, receipt: { receipt_number: "two hundred" } }
  #     end

  #     it "renders an errors json" do
  #       receipt_response = json_response
  #       expect(receipt_response).to have_key(:errors)
  #     end

  #     it "renders the json errors on why the user could not be created" do
  #       receipt_response = json_response
  #       expect(receipt_response[:errors][:receipt_number]).to include "is not a number"
  #     end

  #     it { should respond_with 422 }
  #   end
  # end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      @receipt = FactoryGirl.create :receipt, user_id: @user.id
      api_authorization_header @user.auth_token 
      delete :destroy, { user_id: @user.id, id: @receipt.id }
    end

    it { should respond_with 204 }
  end

end
