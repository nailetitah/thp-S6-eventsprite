class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Liaisons
  has_many :attendances
  has_many :events, through: :attendances
  has_many :events_created, foreign_key: 'event_planner_id', class_name: "Event"
  
  # Emails
  # after_create :welcome_send

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true

end
