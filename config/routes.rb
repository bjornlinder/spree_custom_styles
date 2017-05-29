Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :products do # , only: [] do
      resources :custom_styles do
        collection do
          post :update_positions
        end
      end
    end
  end
end
