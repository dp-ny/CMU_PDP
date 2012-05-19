class UserPositionsController < ApplicationController
  # GET /user_positions
  # GET /user_positions.json
  def index
    @user_positions = UserPosition.chronological.paginate(:page => params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_positions }
    end
  end

  # GET /user_positions/1
  # GET /user_positions/1.json
  def show
    @user_position = UserPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_position }
    end
  end

  # GET /user_positions/new
  # GET /user_positions/new.json
  def new
    @user_position = UserPosition.new
    @positions = Position.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_position }
    end
  end

  # GET /user_positions/1/edit
  def edit
    @user_position = UserPosition.find(params[:id])
  end

  # POST /user_positions
  # POST /user_positions.json
  def create
    @user_position = UserPosition.new(params[:user_position])

    respond_to do |format|
      if @user_position.save
        format.html { redirect_to @user_position, notice: 'User position was successfully created.' }
        format.json { render json: @user_position, status: :created, location: @user_position }
      else
        format.html { render action: "new" }
        format.json { render json: @user_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_positions/1
  # PUT /user_positions/1.json
  def update
    @user_position = UserPosition.find(params[:id])

    respond_to do |format|
      if @user_position.update_attributes(params[:user_position])
        format.html { redirect_to @user_position, notice: 'User position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_positions/1
  # DELETE /user_positions/1.json
  def destroy
    @user_position = UserPosition.find(params[:id])
    @user_position.destroy

    respond_to do |format|
      format.html { redirect_to user_positions_url }
      format.json { head :no_content }
    end
  end
end
