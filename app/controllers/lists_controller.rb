class ListsController < ApplicationController
  before_action :authenticate_user!
  def index
    @lists = current_user.lists.includes :tasks
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new list_params
    if @list.save!
      flash[:message] = "Successfully created a list..."
      redirect_to lists_path
    else
      flash[:error] = "Unable to create"
      redirect_to new_list_path
    end
  end

  def destroy
    @list = current_user.lists.find params[:id]
    @list.destroy!
    redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
