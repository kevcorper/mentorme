class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    @topic = Topic.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id
    @topic = Topic.new(name: params[:appointment][:topic])
    @appointment.topics << @topic
    if @appointment.save
      redirect_to user_path(current_user.id)
    end
  end

  def index

  end

  def update

  end

  def show

  end

  private
    def appointment_params
      params.require(:appointment).permit(:date, :start_time, :end_time, :mentor_phase)
    end

end
