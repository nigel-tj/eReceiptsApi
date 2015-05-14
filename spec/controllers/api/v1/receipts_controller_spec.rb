require 'spec_helper'

describe Api::V1::ReceiptsController do
  describe "GET #show" do
    before(:each) do
      @receipt = FactoryGirl.create :receipt
      get :show, id: @receipt.id
    end
    
    it "returns the information about a reporter on a hash" do
      receipt_response = json_response
      expect(receipt_response[:id]).to eql @receipt.id
    end
    
    it { should respond_with 200 }
  end
  
end
