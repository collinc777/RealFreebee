class PoopdollarsController < ApplicationController
  def show
    @poopdollar = Poopdollar.find(params[:id])
    render :text => @poopdollar
  end

  def new
    @poopdollar = Poopdollar.new
    render :text => @poopdollar

  end

  def create
    @poopdollar = Poopdollar.new(params)
  end


  def index 
    @poopdollar = Poopdollar.find(:all)
  end

end
