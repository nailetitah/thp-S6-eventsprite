class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Liaisons
  has_many :attendances
  has_many :events, through: :attendances
  
  # Emails
  after_create :welcome_send


end
