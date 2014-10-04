class ManufacturersController < ActionController::Base
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "You successfully created a manufacturer."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
    @car = Car.new
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country, :id)
  end
end
