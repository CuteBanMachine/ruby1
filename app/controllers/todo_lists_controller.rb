class TodoListsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    service = TodoListCommandService.new
    todo_list = service.create_todo_list(todo_list_params[:user_id], todo_list_params[:name], todo_list_params[:title])
    render json: todo_list, status: :created
  end

  def update
    service = TodoListCommandService.new
    todo_list = service.update_todo_list(params[:id], todo_list_params[:name], todo_list_params[:title])
    render json: todo_list
  end

  def destroy
    service = TodoListCommandService.new
    service.delete_todo_list(params[:id])
    head :no_content
  end

  def index
    service = TodoListQueryService.new
    todo_lists = service.get_todo_lists(params[:user_id])
    render json: todo_lists
  end

  def show
    service = TodoListQueryService.new
    todo_list = service.get_todo_list(params[:id])
    render json: todo_list
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:user_id, :name, :title)
  end
end
