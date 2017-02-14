class Tag < ApplicationRecord
	validates :entity_type, :entity_id, :tags, presence: true

	# should return a JSON representation of the entity 
	# and the tags it has assigned 
	def self.tags entity_type, entity_id
		Tag.where(entity_type: entity_type, entity_id: entity_id).as_json(only: [:entity_type, :entity_id, :tags])
	end

	# Retrives statistics about all the tags OR 
	# Retrives statistics about a specific tagged entity  
	def self.stats entity_type = nil, entity_id = nil
		conditions = ["1=1"]
		conditions << "entity_type = '#{entity_type}' AND entity_id = '#{entity_id}'" if (entity_type && entity_id)
		Tag.select("unnest(tags) as tag, count(*) as count").where(conditions.join(' AND  ')).group("unnest(tags)").order("tag").as_json(only: [:tag, :count])
	end
end
