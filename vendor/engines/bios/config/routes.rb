Refinery::Application.routes.draw do
  resources :bios, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :bios, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
