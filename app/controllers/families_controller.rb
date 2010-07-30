class FamiliesController < ApplicationController
  
  before_filter :require_no_family, :only => [:new, :create]
  before_filter :require_family, :only => [:show, :edit, :update]
  
  # GET /families/new
  # GET /families/new.xml
  def new
    @family = Family.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.xml  { render :xml => @family }
    # end
  end

  # POST /families
  # POST /families.xml
  def create
    @family = Family.new(params[:family])

      if @family.save
        flash[:notice] = "Account registered!"
        redirect_back_or_default account_url
      else
        render :action => :new
      end
  end

  # PUT /families/1
  # PUT /families/1.xml
  def update
    
    @family = @current_family # makes our views "cleaner" and more consistent
    if @family.update_attributes(params[:family])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def show
    @family = @current_family
  end

  def edit
    @family = @current_family
  end

end
