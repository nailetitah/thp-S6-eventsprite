class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event

  # after_create :attendance_send

end
