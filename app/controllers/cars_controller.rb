class CarsController < ActionController::Base
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
launc    @car.manufacturer_id = params[:manufacturer_id]

    if @car.save
      flash[:notice] = "You successfully created a car."
      redirect_to manufacturer_path(@manufacturer)
    else
      render 'manufacturers/show'
    end
  end

  private
  
  def car_params
    params.require(:car).permit(:color, :mileage, :year)
  end
end
