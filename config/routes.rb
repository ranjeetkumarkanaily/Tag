Rails.application.routes.draw do
  scope '/api', defaults: { format: :json } do
    scope '/v1' do
       post '/tag' => 'tags#create'
       get '/tags/:entity_type/:entity_id' => 'tags#show'
       delete '/tags/:entity_type/:entity_id' => 'tags#destroy'
       get '/stats(/:entity_type/:entity_id)' => 'tags#stats'
    end
  end
end
