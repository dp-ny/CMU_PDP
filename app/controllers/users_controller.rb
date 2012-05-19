class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /users
  # GET /users.json
  def index
    @users = User.order(sort_column + ' ' + sort_direction).paginate(:page => params[:page]).per_page(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @attendance = EventAttendance.for_user(@user.id).paginate(:page => params[:page]).per_page(10)
    @exact_attendance = @user.take_attendance
    @present_events = @exact_attendance[0]
    @late_events = @exact_attendance[1]
    @absent_events = @exact_attendance[2]
    @transactions = Transaction.for_user(@user.id)
    @user_positions = UserPosition.for_user(@user.id).chronological
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @positions = Position.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @positions = Position.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @positions = Position.all
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'Signed Up!' }
        format.json { render json: root_url, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    @positions = Position.all
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name, first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
