class FamilyMembersController < ApplicationController
  
  before_filter :require_family
  
  # GET /family_members
  # GET /family_members.xml
  def index
    @family_members = @current_family.family_members

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @family_members }
    end
  end

  # GET /family_members/1
  # GET /family_members/1.xml
  def show
    @family_member = FamilyMember.find(params[:id])
    
    unless @current_family.member?(@family_member)
      flash[:warning] = "Requested family member is not a member of your family"
      redirect_to show_family_members
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @family_member }
    end
  end

  # GET /family_members/new
  # GET /family_members/new.xml
  def new
    @family_member = FamilyMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @family_member }
    end
  end

  # GET /family_members/1/edit
  def edit
    @family_member = FamilyMember.find(params[:id])
  end

  # POST /family_members
  # POST /family_members.xml
  def create
    @family_member = FamilyMember.new(params[:family_member])
    @family_member.family = @current_family

    respond_to do |format|
      if @family_member.save
        format.html { redirect_to(family_family_member_url(@current_family, @family_member), :notice => 'A Family Member was successfully created.') }
        format.xml  { render :xml => @family_member, :status => :created, :location => @family_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @family_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /family_members/1
  # PUT /family_members/1.xml
  def update
    @family_member = FamilyMember.find(params[:id])

    respond_to do |format|
      if @family_member.update_attributes(params[:family_member])
        format.html { redirect_to(family_family_member_url(@current_family, @family_member), :notice => 'A Family Member was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @family_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /family_members/1
  # DELETE /family_members/1.xml
  def destroy
    @family_member = FamilyMember.find(params[:id])
    @family_member.destroy

    respond_to do |format|
      format.html { redirect_to(family_family_members_url(@current_family)) }
      format.xml  { head :ok }
    end
  end
  
end
