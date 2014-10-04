class WelcomeController < ActionController::Base
  def index
    @manufacturers = Manufacturer.all
  end
end
