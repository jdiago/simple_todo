Rails.application.routes.draw do
  devise_for(:users,
             :path => '',
             :path_names => {
               :sign_in => 'sign-in',
               :sign_out => 'sign-out',
               :sign_up => 'sign-up'
             })

  resources :todo_lists, :path => 'lists' do
    resources :list_items, :only => [:create, :destroy]
  end
  root 'pages#index'
end
