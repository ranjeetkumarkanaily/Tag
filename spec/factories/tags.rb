FactoryGirl.define do
  factory :tag do
    entity_type Faker::Address.city
	entity_id Faker::Address.zip
	tags Faker::Lorem.words(4)
  end
end
