class ListsController < ApplicationController
  before_action :set_list, except: [:index, :new, :create]
  before_action :authenticate_user!

  def index
    @lists = current_user.lists
  end

  def show
  end

  def edit
    render partial: "form"
  end

  def update

    if @list.update(list_params)
      redirect_to list_path
    else
      render :edit
    end
  end

  def new
    @list = List.new
    render partial: "form"
  end

  def create
    @list = current_user.lists.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render partial: "form"
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = current_user.lists.find(params[:id])
  end

 
  

end
