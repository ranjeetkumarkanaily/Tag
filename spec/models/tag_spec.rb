require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is new Tag object" do
    expect(Tag.new).to be_a_new(Tag)
  end

  it "is valid with valid attributes" do
    expect(Tag.new(entity_type: 'Product', entity_id: '1234', tags: ['Red', 'Bridge', 'Sydney'])).to be_valid
  end


end
