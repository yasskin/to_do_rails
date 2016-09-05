class ListsController < ApplicationController
  def index
    @lists = List.all
    render :index
  end

  def show
    @list = List.find(params[:id])
    render :show
  end

  def new
    @list = List.new
    render :new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end

end
