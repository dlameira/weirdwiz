class DropsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @drops = Drop.all
  end

  def show
    @drop = Drop.find(params[:id])
  end

  def new
    @drop = Drop.new
  end

  def edit
    @drop = Drop.find(params[:id])
  end

  def create
    @drop = Drop.new(drop_params)

    if @drop.save
      redirect_to @drop
    else
      render :new
    end
  end

  def update
    @drop = Drop.find(params[:id])

    if @drop.update(drop_params)
      redirect_to @drop
    else
      render :edit
    end
  end

  def destroy
    @drop = Drop.find(params[:id])
    @drop.destroy

    redirect_to drops_path
  end

  private

  def drop_params
    params.require(:drop).permit(:title, :description)
  end
end
