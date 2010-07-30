class FamilySessionsController < ApplicationController
  before_filter :require_no_family, :only => [:new, :create]
  before_filter :require_family, :only => :destroy
  
  def new
    @family_session = FamilySession.new
  end
  
  def create
    @family_session = FamilySession.new(params[:family_session])
    if @family_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_family_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_family_session_url
  end
end
