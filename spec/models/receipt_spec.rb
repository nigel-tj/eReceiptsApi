require 'spec_helper'

describe Receipt do
  #let(:receipt) { FactoryGirl.build :receipt }
  #subject { receipt }

  it { should respond_to(:header) }
  it { should respond_to(:footer) }
  it { should respond_to(:receipt_number) }
  it { should respond_to(:user_id) }


  it { should validate_presence_of :header }
  it { should validate_presence_of :footer }
  it { should validate_numericality_of(:receipt_number).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of :user_id }
end
