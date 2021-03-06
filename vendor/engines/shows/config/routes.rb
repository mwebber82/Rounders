Refinery::Application.routes.draw do
  resources :shows, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :shows, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
