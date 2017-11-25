Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/companies", to: "companies#index"
  get "/companies/alphabetically", to: "companies#alphabetically"
  get "/companies/with_modern_plan", to: "companies#with_modern_plan"
end
