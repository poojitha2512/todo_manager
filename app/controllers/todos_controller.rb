# todos_controller.rb
class TodosController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.all.map { |todo| todo.to_pleasant_string }.join("\n")
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = current_user.todos.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
    #response_text = "hey new todo created with id #{new_todo.id}"
    #render plain: response_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = current_user.todos.find(id)
    todo.completed = completed
    todo.save!
    #render plain: "updated todo #{completed}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
