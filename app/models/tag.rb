class Tag < ApplicationRecord
	has_many :goal_tags
  has_many :goals, through: :goal_tags, source: :goal

  def self.get_random_tag_ids
  	Tag.all.pluck(:id).sample(5)
  end

  def self.grab_random_tags
  	Tag.get_random_tag_ids.map { |id| Tag.find(id) }
  end
end
