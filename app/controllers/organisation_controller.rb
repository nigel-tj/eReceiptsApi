class OrganisationController < ApplicationController
  before_action :authenticate_admin!

  def list
    @organisations = Organisation.all
  end

  def show
    @organisation = Organisation.find(params[:id])
  end

  def new
    @organisation = Organisation.new
    #@organisation_new = Organisation.new
    #@receipts = Receipt.find(:all)
  end

  def edit
    @organisation = Organisation.find(params[:id])
    @receipts = Receipt.find(:all)
  end

  def update
    @organisation = Organisation.find(params[:id])

    if @organisation.update_attributes(params[:name])
      redirect_to :action => 'show', :id => @organisation
    else
      #@receipts = Receipt.find(:all)
      render :action => 'edit'
    end
  end

  def delete
    Organisation.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      redirect_to :action => 'list'
    else
      #@receipts = Receipt.find(:all)
      render :action => 'new'
    end
  end

  def show_receipts
    @receipt = Receipt.find(params[:id])
  end

    private
    
    def organisation_params
      params.require(:organisation).permit(:name)
    end

end
