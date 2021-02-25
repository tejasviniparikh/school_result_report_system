Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :schools, only: %i[index create]
    end
  end
  root to: "reports#show"
  get 'school_wise_line_chart', to: 'reports#school_wise_line_chart'
  get 'year_wise_result', to: 'reports#year_wise_result'
end
