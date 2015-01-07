class HungrybeesController < ApplicationController
  def show
    @hungrybee = Hungrybee.find(params[:id])
  end

  def new
    @hungrybee = Hungrybee.new
  end

  def create
    @hungrybee = Hungrybee.new(hungrybee_params)
    if @hungrybee.save
      flash[:success] = "Welcome to Freebee!"
      redirect_to @hungrybee
    else
      render 'new'
    end
  end

  private

    def hungrybee_params
      params.require(:hungrybee).permit(:name, :phone_number, :password,
                                        :password_confirmation)
    end
end
