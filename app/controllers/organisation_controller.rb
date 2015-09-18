class OrganisationController < ApplicationController
  before_action :authenticate_admin!

  def list
    @organisations = Organisation.all
  end

  def show
    @organisation = Organisation.find_by_id(params[:id])
    redirect_to :action => 'show', :id => @organisation.id
  end

  def new
    @organisation = Organisation.new
  end

  def edit
    @organisation = Organisation.find_by_id(params[:id])
    #redirect_to :action => 'show', :id => @organisation
    #@receipts = Receipt.find(:all)
  end

  def update
    @organisation = Organisation.find_by_id(params[:id])

    if @organisation.update_attributes(organisation_params)
      redirect_to :action => 'list'
    else
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
      render :action => 'new'
    end
  end

  def receipts
    @org = Organisation.find_by_id(params[:id])
    @receipts = Receipt.where(:token => @org.token)
  end

    private
    
    def organisation_params
      params.require(:organisation).permit(:name, :email, :contact)
    end

end
