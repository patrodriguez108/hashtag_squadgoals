class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :goals
  has_many :visions

  has_many :champ_connections, class_name: :Connection, foreign_key: :champ_id
  has_many :squad_members, through: :champ_connections

  has_many :squad_connections, class_name: :Connection, foreign_key: :squad_member_id
  has_many :champs, through: :squad_connections
end
