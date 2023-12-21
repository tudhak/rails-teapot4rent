class TeapotsController < ApplicationController
  before_action :set_teapot, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @teapots = Teapot.where(user: current_user)

    @all_teapots = Teapot.all # Attention aux requêtes N+1
    if params[:query].present?
      sql_subquery = <<~SQL
        teapots.style @@ :query
        OR teapots.description @@ :query
      SQL
      @all_teapots = @all_teapots.where(sql_subquery, query: params[:query])
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @teapot = Teapot.new
  end

  def create
    @teapot = Teapot.new(teapot_params)
    @teapot.user = current_user
    if @teapot.save
      redirect_to teapot_path(@teapot), notice: "New teapot successfully created !"
    else
      flash[:alert] = "Fields incorrectly completed. Please check."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @teapot.update(teapot_params)
      redirect_to teapot_path(@teapot)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teapot.destroy
    redirect_to teapots_path, status: :see_other
  end

  private

  def set_teapot
    @teapot = Teapot.find(params[:id])
  end

  def teapot_params
    params.require(:teapot).permit(:style, :description, :price_per_day, photos: [])
  end
end
