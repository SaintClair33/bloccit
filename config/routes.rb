Bloccit::Application.routes.draw do
  #get "contact/contact"

  get "welcome/index"
  get "welcome/about"
  get "welcome/contact"

      root to: 'welcome#index'
end
