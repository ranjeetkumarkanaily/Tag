FactoryGirl.define do
  factory :tag do
    entity_type {Faker::Name.last_name}
	entity_id {Faker::Address.zip}
	tags {Faker::Lorem.words(4)}
  end
end
