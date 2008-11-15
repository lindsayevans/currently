class StatusTypesController < ApplicationController

  # GET /status_types
  # GET /status_types.xml
  def index
    @status_types = StatusType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @status_types }
    end
  end

  # GET /status_types/1
  # GET /status_types/1.xml
  def show
    @status_type = StatusType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @status_type }
    end
  end

  # GET /status_types/new
  # GET /status_types/new.xml
  def new
    @status_type = StatusType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @status_type }
    end
  end

  # GET /status_types/1/edit
  def edit
    @status_type = StatusType.find(params[:id])
  end

  # POST /status_types
  # POST /status_types.xml
  def create
    @status_type = StatusType.new(params[:status_type])

    respond_to do |format|
      if @status_type.save
        flash[:notice] = 'Status Type was successfully created.'
        format.html { redirect_to(@status_type) }
        format.xml  { render :xml => @status_type, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /status_types/1
  # PUT /status_types/1.xml
  def update
    @status_type = StatusType.find(params[:id])

    respond_to do |format|
      if @status_type.update_attributes(params[:status_type])
        flash[:notice] = 'Status Type was successfully updated.'
        format.html { redirect_to(@status_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @status_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /status_types/1
  # DELETE /status_types/1.xml
  def destroy
    @status_type = StatusType.find(params[:id])
    @status_type.destroy

    respond_to do |format|
      format.html { redirect_to(status_types_url) }
      format.xml  { head :ok }
    end
  end
end

