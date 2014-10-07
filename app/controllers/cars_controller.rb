class CarsController < ActionController::Base
  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car.manufacturer = @manufacturer

    if @car.save
      flash[:notice] = "You successfully created a car."
      redirect_to manufacturer_path(@manufacturer)
    else
      flash[:notice] = "Your record could not be saved."
      render 'manufacturers/show'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :mileage, :year)
  end
end
