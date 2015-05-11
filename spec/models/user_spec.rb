require 'spec_helper'

describe User do
  #pending "add some examples to (or delete) #{__FILE__}"
  before { @user = FactoryGirl.build(:user) }
  subject { @user }

  it { should respond_to(:auth_token) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  it { should validate_uniqueness_of(:auth_token)}
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_confirmation_of(:password) }
  it { should allow_value('example@domain.com').for(:email) }

  it { should have_many(:receipts) }  

  describe "#generate_authentication_token!" do
    it "generates a unique token" do
      Devise.stub(:friendly_token).and_return("auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).to eql "auniquetoken123"
    end
    
    it "generates another token when one already has been taken" do
      existing_user = FactoryGirl.create(:user, auth_token: "auniquetoken123")
      @user.generate_authentication_token!
      expect(@user.auth_token).not_to eql existing_user.auth_token
    end
  end

  describe "#receipts association" do
    
    before do
      @user.save
      3.times { FactoryGirl.create :receipt, user: @user }
    end

    it "destroys the associated receipts on self destruct" do
      receipts = @user.receipts
      @user.destroy
      receipts.each do |receipt|
        expect(Receipt.find(receipt)).to raise_error ActiveRecord::RecordNotFound
      end
    end
  end

end
