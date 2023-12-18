class BookingsController < ApplicationController
  before_action :set_teapot, only: [:create]

  def index
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.teapot = @teapot
    @booking.status = "pending"
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render partial: "form", locals: { teapot: @teapot, booking: @booking }, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def set_teapot
    @teapot = Teapot.find(params[:teapot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
