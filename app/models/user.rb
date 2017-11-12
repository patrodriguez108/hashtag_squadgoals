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

  has_attached_file :profile_pic, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  def self.search(search)
    where("username ILIKE ? OR given_name ILIKE ? OR family_name ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
  
  def current_vision_time_frame_in_years_from_now
    self.visions.last.most_recent_time_frame_in_years_from_now
  end

  def current_vision_statement
    self.visions.last.statement
  end

  def requests?
    self.squad_connections.each { |connection| return true if connection.status_id == 1 }
    false
  end

  def requests_count
    self.squad_connections.select { |connection| connection.status_id == 1 }.length
  end

  def accepted_squad
    self.squad_connections.select { |connection| connection.status_id == 2 }
  end
end
