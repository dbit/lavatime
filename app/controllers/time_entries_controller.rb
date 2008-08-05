class TimeEntriesController < ApplicationController
  # GET /time_entries
  # GET /time_entries.xml
  def index
    if logged_in?
      @time_entries = current_user.time_entries 
    else
      @time_entries = TimeEntry.find_all_by_user_id( nil )
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @time_entries }
    end
  end

  # GET /time_entries/1
  # GET /time_entries/1.xml
  def show
    @time_entry = TimeEntry.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @time_entry }
    end
  end

  # GET /time_entries/new
  # GET /time_entries/new.xml
  def new
    @time_entry = TimeEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @time_entry }
    end
  end

  # GET /time_entries/1/edit
  def edit
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.user_id = current_user.id if logged_in?
  end

  # POST /time_entries
  # POST /time_entries.xml
  def create
    @time_entry = TimeEntry.new(params[:time_entry])
    @time_entry.start_time = Time.now
    @time_entry.user_id = current_user.id if logged_in?
    
    respond_to do |format|
      if @time_entry.save
        flash[:notice] = 'TimeEntry was successfully created.'
        format.html { redirect_to( time_entries_path ) }
        format.xml  { render :xml => @time_entry, :status => :created, :location => @time_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @time_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /time_entries/1
  # PUT /time_entries/1.xml
  def update
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.end_time = Time.now
    respond_to do |format|
      if @time_entry.update_attributes(params[:time_entry])
        flash[:notice] = 'TimeEntry was successfully updated.'
        format.html { redirect_to( time_entries_path ) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @time_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.xml
  def destroy
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.destroy

    respond_to do |format|
      format.html { redirect_to(time_entries_url) }
      format.xml  { head :ok }
    end
  end
end
