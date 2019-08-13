class Event < ApplicationRecord
  belongs_to :event_planner, class_name: "User"
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
      errors.add(:duration, "doit être un multiple de 5")
    end
  end

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end

  def end_date
    self.start_date + (duration * 60)
  end

end
