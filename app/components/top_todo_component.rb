class TopTodoComponent < ViewComponent::Base
  include Motion::Component

  stream_from "todos:updated", :handle_updated

  def initialize(count: 5, total: 1)
    @count = count
    @todos = Todo.order(created_at: :desc).limit(count).pluck(:name)
    @total = total
  end

  map_motion :add

  def add
    @total += 1

  end

  def handle_increment(count)
    @total = count
  end

  def handle_updated(name)
    @todos = Todo.order(id: :desc).last(@count - 1).map(&:name)
  end
end
