class Tag < ApplicationRecord
	validates :entity_type, :entity_id, :tags, presence: true

	def self.tags entity_type, entity_id
		Tag.where(entity_type: entity_type, entity_id: entity_id).as_json(only: [:entity_type, :entity_id, :tags])
	end
end
