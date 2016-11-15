$ rails generate model users
$ rails generate migration users
$ rails generate controller users
$ rails generate controller articles
$ rails routes
                Prefix Verb   URI Pattern                                    Controller#Action
                 users GET    /users(.:format)                               users#index
                       POST   /users(.:format)                               users#create
              new_user GET    /users/new(.:format)                           users#new
             edit_user GET    /users/:id/edit(.:format)                      users#edit
                  user GET    /users/:id(.:format)                           users#show
                       PATCH  /users/:id(.:format)                           users#update
                       PUT    /users/:id(.:format)                           users#update
                       DELETE /users/:id(.:format)                           users#destroy
category_article_index GET    /categories/:category_id/article(.:format)     article#index
                       POST   /categories/:category_id/article(.:format)     article#create
  new_category_article GET    /categories/:category_id/article/new(.:format) article#new
          edit_article GET    /article/:id/edit(.:format)                    article#edit
               article GET    /article/:id(.:format)                         article#show
                       PATCH  /article/:id(.:format)                         article#update
                       PUT    /article/:id(.:format)                         article#update
                       DELETE /article/:id(.:format)                         article#destroy
            categories GET    /categories(.:format)                          categories#index
                       POST   /categories(.:format)                          categories#create
          new_category GET    /categories/new(.:format)                      categories#new
         edit_category GET    /categories/:id/edit(.:format)                 categories#edit
              category GET    /categories/:id(.:format)                      categories#show
                       PATCH  /categories/:id(.:format)                      categories#update
                       PUT    /categories/:id(.:format)                      categories#update
                       DELETE /categories/:id(.:format)                      categories#destroy
