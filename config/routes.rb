Rails.application.routes.draw do
  root "staticpages#index"
  post "/search", to: "staticpages#search"
end