class EventAttendancesController < ApplicationController
  # GET /event_attendances
  # GET /event_attendances.json
  def index
    @event_attendances = EventAttendance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_attendances }
    end
  end

  # GET /event_attendances/1
  # GET /event_attendances/1.json
  def show
    @event_attendance = EventAttendance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_attendance }
    end
  end

  # GET /event_attendances/new
  # GET /event_attendances/new.json
  def new
    @event_attendance = EventAttendance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_attendance }
    end
  end

  # GET /event_attendances/1/edit
  def edit
    @event_attendance = EventAttendance.find(params[:id])
  end

  # POST /event_attendances
  # POST /event_attendances.json
  def create
    @event_attendance = EventAttendance.new(params[:event_attendance])

    respond_to do |format|
      if @event_attendance.save
        format.html { redirect_to @event_attendance, notice: 'Event attendance was successfully created.' }
        format.json { render json: @event_attendance, status: :created, location: @event_attendance }
      else
        format.html { render action: "new" }
        format.json { render json: @event_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_attendances/1
  # PUT /event_attendances/1.json
  def update
    @event_attendance = EventAttendance.find(params[:id])

    respond_to do |format|
      if @event_attendance.update_attributes(params[:event_attendance])
        format.html { redirect_to @event_attendance, notice: 'Event attendance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attendances/1
  # DELETE /event_attendances/1.json
  def destroy
    @event_attendance = EventAttendance.find(params[:id])
    @event_attendance.destroy

    respond_to do |format|
      format.html { redirect_to event_attendances_url }
      format.json { head :no_content }
    end
  end
end
