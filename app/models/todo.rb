class Todo < ApplicationRecord
  after_commit :broadcast_created, on: :create

  def broadcast_created
    ActionCable.server.broadcast("todos:created", name)
  end
end
