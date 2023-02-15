Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing#index"

  if Rails.env.production?
    constraints protocol: "http://" do
      match "(*any)" => redirect { |params, request|
        URI.parse(request.url).tap { |uri| uri.scheme = "https" }.to_s
      }, via: [:get, :post]
    end
  end
  
end
