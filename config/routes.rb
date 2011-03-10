Refinery::Application.routes.draw do
  resources :widgets, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :widgets, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
