class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  #Validations
  validate :start_date_cannot_be_in_the_past
  validate :duration_is_multiple_of_5
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: { in: 1..50, message: "est incorrect" }
  validates :description, presence: true, length: { in: 20..1000, message: "est incorrect" }
  validates :price, presence: true, inclusion: { in: 1..1000, message: "%{value} n'est pas compris entre 1 et 1000 €" }
  validates :location, presence: true

  #Methods

  def duration_is_multiple_of_5
    if duration % 5 != 0 
      errors.add(:duration, "must be multiple of 5")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

end
