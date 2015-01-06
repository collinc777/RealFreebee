class HungrybeesController < ApplicationController
  def show
    @hungrybee = Hungrybee.find(params[:id])
  end

  def new
    @hungrybee = Hungrybee.new
  end
end
