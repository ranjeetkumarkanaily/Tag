require 'rails_helper'

RSpec.describe Tag, type: :model do

	describe "Tag attributes" do
	  it "is new Tag object" do
	    expect(Tag.new).to be_a_new(Tag)
	  end

	  it "is not valid without any attributes" do
	  	tag = Tag.new()
	  	expect(tag).to_not be_valid
	  end

	  it "is not valid without an entity_type" do
	  	tag = Tag.new(entity_id: '1234', tags: ['Red', 'Bridge'])
	  	expect(tag).to_not be_valid
	  end
	  it "is not valid without an entity_id" do
	  	tag = Tag.new(entity_type: 'Product', tags: ['Red', 'Bridge'])
	  	expect(tag).to_not be_valid	
	  end
	  it "is not valid without a tags" do
		tag = Tag.new(entity_type: 'Product', entity_id: '1234')  	
		expect(tag).to_not be_valid	
	  end

	  it "is valid with valid attributes" do
	    expect(Tag.new(entity_type: 'Product', entity_id: '1234', tags: ['Red', 'Bridge', 'Sydney'])).to be_valid
	  end
	end

	describe "Tag functions" do
		it "retrives all tags" do
			tag = build(:tag)
			entity_type = tag.entity_type
			entity_id = tag.entity_id

			tag.save!
			result = Tag.tags entity_type, entity_id
			expect(result).to eql([tag.as_json(only: [:entity_type, :entity_id, :tags])]) 
		end 
	end

end
