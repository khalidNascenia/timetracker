class DashboardController < ApplicationController

  before_action :restrict_access, only: [:create, :update]
  before_action :authenticate_user!

  layout 'time_tracker'

  def index
    user = current_user
    @attendance = user.attendances.where(checkin_date: Time.now.strftime('%y-%m-%d')).last
    @attendances = Attendance.monthly_attendance_summary.group_by(&:user_id)
    @attendance_summary = user.attendances.monthly_attendance_summary.includes(:children)

    respond_to do |format|
      format.html
    end
  end

  def show

  end

  def new

  end

  def edit
  end

  def create

  end

  def update

  end

  def destroy

  end

  private

end
