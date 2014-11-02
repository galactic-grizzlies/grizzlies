Rails.application.routes.draw do
  root 'products#index'

  resources :products, only: [:index, :show]

  scope :checkout, as: 'checkout' do
    get      ''       => 'checkout#index'
    put     'add'     => 'checkout#add'
    delete  'delete'  => 'checkout#delete'
    post    'order'   => 'checkout#order'
    get     'success' => 'checkout#success'
  end
end
