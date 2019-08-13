class AddAdminToEvent < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :event_planner, index: true
    add_foreign_key :events, :users, column: :event_planner_id
  end
end
