class TodoListQueryService
  def get_todo_lists(user_id)
    User.find(user_id).todo_lists
  end

  def get_todo_list(todo_list_id)
    TodoList.find(todo_list_id)
  end
end