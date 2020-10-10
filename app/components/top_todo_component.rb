class TopTodoComponent < ViewComponent::Base
  include Motion::Component

  stream_from "todos:created", :handle_created

  def initialize(count: 5, total: 1)
    @count = count
    @todos = Todo.order(created_at: :desc).limit(count).pluck(:name)
    @total = total
  end

  map_motion :add

  def add
    @total += 1
  end

  def handle_created(name)
    @todos = [name, *@todos.first(@count - 1)]
  end
end
