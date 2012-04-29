require 'test_helper'

class EventAttendancesControllerTest < ActionController::TestCase
  setup do
    @event_attendance = event_attendances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_attendances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_attendance" do
    assert_difference('EventAttendance.count') do
      post :create, event_attendance: { absent: @event_attendance.absent, event_id: @event_attendance.event_id, late: @event_attendance.late, present: @event_attendance.present, user_id: @event_attendance.user_id }
    end

    assert_redirected_to event_attendance_path(assigns(:event_attendance))
  end

  test "should show event_attendance" do
    get :show, id: @event_attendance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_attendance
    assert_response :success
  end

  test "should update event_attendance" do
    put :update, id: @event_attendance, event_attendance: { absent: @event_attendance.absent, event_id: @event_attendance.event_id, late: @event_attendance.late, present: @event_attendance.present, user_id: @event_attendance.user_id }
    assert_redirected_to event_attendance_path(assigns(:event_attendance))
  end

  test "should destroy event_attendance" do
    assert_difference('EventAttendance.count', -1) do
      delete :destroy, id: @event_attendance
    end

    assert_redirected_to event_attendances_path
  end
end
