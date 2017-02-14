require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  
  describe "GET stats" do
    it "has a 200 status code" do
      get :stats
      expect(response.status).to eq(200)
    end

    it "has stats of all the tags" do
      create(:tag)
      get :stats
      
      result = JSON.parse response.body
      expected_result = {"stats" => Tag.stats}
      expect(result).to eq(expected_result)
    end
  end

  describe "POST create" do
    it "creates invalid tag entity" do
      tag = {"entity_id" => '1234', "tags" => ['Red', 'Bridge']}
      post :create, params: tag
      
      expect(response.status).to eq(406)
    end

    it "creates tag for an entity" do
      tag = {"entity_type" => 'Product', "entity_id" => '1234', "tags" => ['Red', 'Bridge']}
      post :create, params: tag
      
      result = JSON.parse(response.body)
      expected_result = {"tag" => tag}
      expect(result).to include(expected_result)
    end
  end
end
