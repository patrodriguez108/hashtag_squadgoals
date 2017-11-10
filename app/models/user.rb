class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :goals
  has_many :visions
  has_many :squad_members, class_name: 'Connection'
  has_many :champs, class_name: 'Connection'
end
