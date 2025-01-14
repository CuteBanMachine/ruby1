class ListsController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  before_action :set_list, only: [:show, :update, :destroy]

  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def index
    lists = List.all
    render json: lists
  end

  def show
    list = List.find(params[:id])
    render json: list
  rescue ActiveRecord::RecordNotFound
    render json: { error: "List not found"}, status: :not_found
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "List not found"}, status: :not_found
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private

  def set_list
    @list = List.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "List not found" }, status: :not_found
  end

  def list_params
    params.require(:list).permit(:task, :todo_list_id) 
  end
end
