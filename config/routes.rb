Crowdfunding::Application.routes.draw do

  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users

  root :to => "project#index"

  get "project/askforhelpc"=>"project#askforhelpc"
  get "project/index"=>"project#index"
  get "project/aboutus"=>"project#aboutus"
  get "project/whoami"=>"project#whoami"
  resources :project
  
  get "ideaindex/index"=>"ideaindex#index"
  get "ideaindex/index/:page"=>"ideaindex#index"
  put "ideaindex/updateanswer/:id"=>"ideaindex#updateanswer"
  post "ideaindex/updateanswer/:id"=>"ideaindex#updateanswer"
  put "ideaindex/votecreate/:id"=>"ideaindex#votecreate"
  post "ideaindex/votecreate/:id"=>"ideaindex#votecreate"
  resources :ideaindex
 
  get "reflashindex/index"=>"reflashindex#index"
  get "reflashindex/index/:page"=>"reflashindex#index"
  put "reflashindex/updateanswer/:id"=>"reflashindex#updateanswer"
  post "reflashindex/updateanswer/:id"=>"reflashindex#updateanswer"
	post "reflashindex/history/historyupdate"=>"reflashindex#updateh"
	put "reflashindex/history/historyupdate"=>"reflashindex#updateh"
	get "reflashindex/history/:id"=>"reflashindex#history"
  put "reflashindex/updatemail/:pro/:story"=>"reflashindex#updatemail"
  resources :reflashindex
  
  post "startaproject/updateanswer"=>"startaproject#updateanswer"

  put "startaproject/authorizep/:id"=>"startaproject#authorizep"
  get "startaproject/authorizep/:id"=>"startaproject#authorizep"
  put "startaproject/authorizep/updatep/:id"=>"startaproject#updatep"

  get "startaproject/inform/:id"=>"startaproject#inform"
  put "startaproject/inform/:id"=>"startaproject#inform"

  get "startaproject/passtoinvest/:id"=>"startaproject#passtoinvest"
  put "startaproject/passtoinvest/:id"=>"startaproject#passtoinvest"
  get "startaproject/preview/:id"=>"startaproject#preview"
  get "startaproject/notconfirm/:id"=>"startaproject#notconfirm"
  get "startaproject/myindex"=>"startaproject#myindex"
  put "startaproject/myindex"=>"startaproject#myindex"

  get "startaproject/newindex"=>"startaproject#newindex"
  post "startaproject/param/searchresult"=>"startaproject#searchresult"
  get "startaproject/param/searchresult"=>"startaproject#searchresult"
  get "startaproject/param/search"=>"startaproject#search"
  post "startaproject/param/search"=>"startaproject#search"

  get "startaproject/param"=>"startaproject#param"
  post "startaproject/update"=>"startaproject#update"
  get "startaproject/new/:id"=>"startaproject#new"
  put "startaproject/newupdate/:id"=>"startaproject#newupdate"
  get "startaproject/feedbackcreate/:id"=>"startaproject#feedbackcreate"
  put "startaproject/fupdate/:id"=>"startaproject#fupdate"

  put "startaproject/deletepresub/:id"=>"startaproject#deletepresub"
  get "startaproject/remit/:id"=>"startaproject#remit"
  put "startaproject/remit/updateremit/:id"=>"startaproject#updateremit"
  get "startaproject/investlist/:id"=>"startaproject#investlist"
  get "sendmail/:uid/:presubid"=>"startaproject#sendmail"
  put "updatemail/:uid/:presubid"=>"startaproject#updatemail"

  put "startaproject/deleteinvest/:id"=>"startaproject#deleteinvest"
  resources :startaproject

  put "upfile/save_file/:id"=>"upfile#save_file"
  get "upfile/save_file/:id"=>"upfile#save_file"
  post "upfile/save_file/:id"=>"upfile#save_file"
  put "upfile/save_pic/:id"=>"upfile#save_pic"
  get "upfile/save_pic/:id"=>"upfile#save_pic"
  post "upfile/save_pic/:id"=>"upfile#save_pic"

  put "upfile/dl"=>"upfile#dl"
  put "upfile/picshow/:id"=>"upfile#picshow"
  put "upfile/fileshow/:id"=>"upfile#fileshow"
  get "upfile/picshow/:id"=>"upfile#picshow"
  get "upfile/fileshow/:id"=>"upfile#fileshow"

  put "upfile/fileupload/:id"=>"upfile#fileupload"
  get "upfile/fileupload/:id"=>"upfile#fileupload"
  post "upfile/fileupload/:id"=>"upfile#fileupload"
  put "upfile/picupload/:id"=>"upfile#picupload"
  get "upfile/picupload/:id"=>"upfile#picupload"
  post "upfile/picupload/:id"=>"upfile#picupload"
  get "upfile/index/:id"=>"upfile#index"
  resources :upfile

  post "manager/saveaskforhelp"=>"manager#saveaskforhelp"
  put "manager/deletepresub/:id"=>"manager#deletepresub"

  put "manager/deleteinvest/:id"=>"manager#deleteinvest"

  put "manager/update/:id"=>"manager#update"
  put "manager/checkremit/:id"=>"manager#checkremit"
  get "manager/modify/:id"=>"manager#modify"
  put "manager/modify/updatemodify/:id"=>"manager#updatemodify"
  resources :manager

  get "teacher/editpresub/:id"=>"teacher#editpresub"
  put "teacher/editpresub/updatepresub/:id"=>"teacher#updatepresub"
  resources :teacher
  
  resources :mentor

  get "invest/:id/edit/:feedback"=>"invest#edit"  
  resources :invest

  resources :test
  get "test/gettime"=>"test#getTime"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
