Rails.application.routes.draw do
  get 'books/available'
  get 'books/reserved'
  get 'books/bought'

  root 'books#available'
  
  get 'getbook/:book_id', to: 'books#getbook', as: 'getbook'
  get 'changestatebook/:book_id/:new_state', to: 'books#changestatebook', as: 'changestatebook'

  delete 'delete/:book_id', to: 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
