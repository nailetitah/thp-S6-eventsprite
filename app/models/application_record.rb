class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def attendance_send
    UserMailer.attendance_email(self).deliver_now
  end
  
end
