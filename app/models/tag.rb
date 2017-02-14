class Tag < ApplicationRecord
	validates :entity_type, :entity_id, :tags, presence: true
end
