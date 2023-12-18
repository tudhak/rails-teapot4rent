class BookingsController < ApplicationController
  before_action :set_teapot, only: [:create]

  def index
    @bookings = Booking.where(user: current_user)
    @my_booked_teapots = Booking.where(teapot: Teapot.where(user: current_user))
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.teapot = @teapot
    @booking.status = "Pending"
    @booking.total_price = (@booking.end_date - @booking.start_date) * @teapot.price_per_day
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render partial: "form", locals: { teapot: @teapot, booking: @booking }, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(status: "Accepted")
    redirect_to booking_path(@booking)
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: "Rejected")
    redirect_to booking_path(@booking)
  end

  private

  def set_teapot
    @teapot = Teapot.find(params[:teapot_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
