class TodoListCommandService
  def create_todo_list(user_id, name, title)
    user = User.find(user_id)
    user.todo_lists.create!(name: name, title: title)
  end

  def update_todo_list(todo_list_id, name, title)
    todo_list = TodoList.find(todo_list_id)
    todo_list.update!(name: name, title: title)
  end

  def delete_todo_list(todo_list_id)
    todo_list = TodoList.find(todo_list_id)
    todo_list.destroy!
  end
end