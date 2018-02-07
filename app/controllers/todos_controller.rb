class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def create
    # If our ajax request works, we'll hit this binding and then take a look at params
    # binding.pry
    @todo = Todo.create(todo_params)

    respond_to do |format|
      # if the response format is html, redirect as usual
      format.html { redirect_to root_path }

      # if the response format is javascript, do something else...
      format.js { }
    end
  end

  def destroy
     # we need an instance variable `@todo` so we can access it in the next step!
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:description, :priority)
    end

end
