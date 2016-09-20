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
    respond_to do |format|
      format.html { render :new }
      format.js
    end
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List successfully added!"
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
    respond_to do |format|
      format.html { render :edit }
      format.js
    end
  end

  def update
    @list= List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "List successfully updated!"
      redirect_to lists_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "List successfully destroyed!"
    redirect_to lists_path
  end

 private
  def list_params
    params.require(:list).permit(:name)
  end

end
