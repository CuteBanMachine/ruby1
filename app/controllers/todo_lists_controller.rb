class TodoListsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  before_action :set_todo_list, only: [:show, :update]

  def create
    @todo_list = TodoList.new(todo_list_params)
    if @todo_list.save
      render json: @todo_list, status: :created
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  def index
    todo_lists = TodoList.all
    render json: todo_lists
  end

  def show
    todo_list = TodoList.find(params[:id])
    render json: todo_list
  rescue ActiveRecord::RecordNotFound
    render json: { error: "TodoList not found" }, status: :not_found
  end

  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update(todo_list_params)
      render json: @todo_list
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "TodoList not found" }, status: :not_found
  end
  
  private

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Todo_List not found" }, status: :not_found
  end

  def todo_list_params
    params.require(:todo_list).permit(:name, :user_id, :title)
  end
end
