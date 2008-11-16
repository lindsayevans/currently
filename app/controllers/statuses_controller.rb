class StatusesController < ApplicationController

  before_filter :get_all_status_types
  def get_all_status_types
    @all_status_types = StatusType.find :all, :order => 'name ASC'
  end

  def insertions
    render :template => 'statuses/insertions.js.rjs'
  end

  def homepage
    #@recent_status_updates = Status.find_recent 5
  end

  # GET /statuss
  # GET /statuss.xml
  def index
    @statuses = Status.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statuses }
    end
  end

  # GET /statuss/1
  # GET /statuss/1.xml
  def show
    @status = Status.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status }
    end
  end

  # GET /statuss/new
  # GET /statuss/new.xml
  def new
    @status = Status.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status }
    end
  end

  # GET /statuss/1/edit
  def edit
    @status = Status.find(params[:id])
  end

  # POST /statuss
  # POST /statuss.xml
  def create
    @status = Status.new(params[:status_type])

    respond_to do |format|
      if @status.save
        flash[:notice] = 'Status Type was successfully created.'
        format.html { redirect_to(@status) }
        format.xml  { render :xml => @status, :status => :created, :location => @status }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statuss/1
  # PUT /statuss/1.xml
  def update
    @status = Status.find(params[:id])

    respond_to do |format|
      if @status.update_attributes(params[:status_type])
        flash[:notice] = 'Status Type was successfully updated.'
        format.html { redirect_to(@status) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statuss/1
  # DELETE /statuss/1.xml
  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to(statuss_url) }
      format.xml  { head :ok }
    end
  end
end

