class Todo < ApplicationRecord
  after_commit :broadcast_updated

  def broadcast_updated
    ActionCable.server.broadcast("todos:updated", name)
  end
end
