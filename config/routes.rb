MeeldeelCom::Application.routes.draw do
              get  "admin/login", :as => "admin_login"
              post "admin/login" => "admin#login_process",:as=>:admin_login
              get  "admin/logout", :as => "admin_logout"
              get  "admin/newpw"
              post "admin/newpw" => "admin#setpw"
              get "admin" => "admin#dashboard", :as => "admin"
              get "admin/dashboard"
              get "admin/requested"
              post "admin/approve" => "admin#approve" # approve user
              get "admin/approve" => "admin#approve_by_email"
              get "admin/new" => "admin#new", :as => :new_admin
              get "admin/edit/:id" => "admin#edit", :as => :edit_admin
              post "admin/edit/:id" => "admin#edit_process"
              post "admin/create" => "admin#new_process"
              get "admin/cluster" => "admin#new_cluster", :as => :new_cluster
              get "admin/cluster/:id" => "admin#edit_cluster", :as => :new_cluster
              post "admin/cluster" => "admin#cluster_process"
              get "admin/load_restaurant/:id" => "admin#load_restaurant"
              get "admin/load_meals/:id" => "admin#load_meals"
              get "admin/load_meal/:id" => "admin#load_meal"
              get "admin/load_dmeal/:id" => "admin#load_dmeal"
              post "admin/save_dmeal/:id" => "admin#save_dmeal", :as => :save_dmeal
              get "admin/load_drestaurant/:id" => "admin#load_drestaurant"
              post "admin/save_drestaurant/:id" => "admin#save_drestaurant", :as => :save_drestaurant
              get "admin/cwr/:cwr_id" => "admin#dashboard", :as => "admin_cwr"
              post "admin/approve_dmeal" => "admin#approve_dmeal"
              get   "/admin/deal/:id" => "admin#load_deal" # get the deal
              post  "/admin/deal/:id" => "admin#save_deal" # save the deal
              post  "/admin/submitoffer/:id" => "offers#toggle"
              get "orders/show"
              get "orders/edit"
              get "orders/save"
              get "orders/delete"
              get "offers/edit"
              get "offers/destroy"

              #how does it is calling the user home page the page name is not home page 
              root :to => 'user_page#user_page_home'
              post 'setgeo' =>        'pages#setgeo'
              get  'getorders' =>     'pages#getorders'
              get  'getgeo' =>        'pages#getgeo'
              get  'reset' =>        'pages#reset'
             # get   '/api/offers.xml'   => 'api#offers'
              #get   '/api/cuisines.xml' => 'api#cuisines'
              #post  '/api/login.xml'    => 'api#login'
              #post  '/api/logout.xml'   => 'api#logout'
              #get   '/api/clusters.xml' => 'api#clusters'
              #post  '/api/clusters.xml' => 'api#clusters'
              #post  '/api/signup.xml'   => 'api#signup'
              #post  '/api/order.xml'    => 'api#place_order'
              #post  '/api/ccard.xml'    => 'api#ccard'
              #post  '/api/send_sms.xml' => 'api#send_sms'
              #post  '/api/verify_sms.xml' => 'api#send_sms'
              #post  '/api/redeem.xml' => 'api#redeem_points'
              #post  '/api/feedback.xml' => 'api#feedback'
              get   '/api/user.xml'     => 'api#user'
              get   '/users/login'   => 'users#login', :as => "login"
              post  '/users/login'   => 'users#login_process'
              get   '/users/logout'  => 'users#logout', :as => "logout"
              get   '/users/signup'  => 'users#signup', :as => "signup"

              post  '/users/forgot_password'  => 'users#forgot_password'
             
#here i need to see what is going on

              post  '/user_pages/signup'  => 'user_page#signup_process'
              post  '/users/get_it_listed'  => 'users#get_it_listed'

              #get  '/mobileapps'  => 'pages#mobileapps'
              get '/mobileapps' => 'user_page#mobileapps'
              get  '/aboutus'  => 'user_page#about_us'
              post  '/careers'  => 'user_page#careers'
              get   '/careers' => 'user_page#careers'
              get  '/privacy'  => 'user_page#privacy'
              get  '/terms'  => 'user_page#terms'

              get  "todaysdeal/:id" => "user_page#user_page_home"
              match "/user_page_home" => "user_page#user_page_home"
              match  "/set_preferences" => "users#set_preferences"

              post "/users/update_user_name" => "users#update_user_name"
              post "/users/update_password" => "users#update_password"
              post "/users/update_email" => "users#update_email"


              post  '/users/signup'  => 'users#signup_process'
              get   '/users/signup2' => 'users#signup2'
              post  '/users/set_fp'  => 'users#set_fp'
              post  '/users/setloc'  => 'users#setloc'
              get   '/users/profile' => 'users#profile', :as => "profile"
              post  '/users/profile' => 'users#edit'
              get   "/admin/restaurants/thankyou" => "restaurants#thankyou"
              get   "/admin/restaurants/new" => "restaurants#new", :as => :new_restaurant
              
              get   "/admin/schedule/:yday" => "admin#get_schedule"
              get   "/admin/scheduleinfo/:yday" => "admin#get_schedule_info"
              post   "/admin/newtarget" => "admin#newtarget"
              post   "/admin/settarget/:id" => "admin#settarget"
              get   "/admin/meals/new/:id"     => "meals#new", :as => :add_meal
              post  "/admin/meals/create/:id"  => "meals#create", :as => :create_meal
              get   "/admin/meals/:id/edit"    => "meals#edit", :as => :edit_meal
              post  "/admin/meals/:id/edit"    => "meals#update"
              get   "/admin/meals/:id/list"    => "meals#list"
              get   "restaurants/:id/meals/delete"  => "meals#delete"
              get   "restaurants/:id/meals/"    => "meals#list"


              #get   "/showdetails/:id"    => "pages#showdetails"


              #get   "/show/:id"    => "pages#show", :as => :show_deal





              get   "/notfound" => "meals#notfound", :as => :notfound
              post "/order/:id" => 'orders#create'


              #  get "showdetails/:id"  =>'pages#dishdetail'
              get 'orderdetail/:id' =>"pages#orderdetail"

              get 'success'=> "user_page#success"

              # i am changing here
              get 'mypoints' => 'user_page#mypoints'
               #get 'mypoints' => "pages#mypoints"
 
              get "invite_friends" =>"user_page#invite_friends"

              get "mobileapps" => "user_page#mobileapps"


              post "/users/set_cuisines" =>"users#set_cuisines"

              get "order_details" => "user_page#order_details"

              get "my_points" => "user_page#my_points"

              get "thankyou" => "user_page#thankyou"

             # get  "/show_todays_meal" => "user_page#user_page_home"

              match "/sales/dashboard" => "sales#dashboard"
              match "/sales_locations" => "sales#sales_locations"
              match "/sales_locations_edit" => "sales#sales_locations_edit"
               match "/sales/check_email"=>"sales#check_email"
                match "/sales/sales_locations" => "sales#sales_locations"


              match  "/delete" => "sales#delete"
              match "/sales/dashboard" => "sales#dashboard"
              match "/sales_locations" => "sales#sales_locations"
              match "/sales_locations_edit" => "sales#sales_locations_edit"
              match "/copywriter/dashboard" => "copywriter#dashboard"
              match "/copywriter/edit_review" => "copywriter#edit_review"
              match "/copywriter/preview_business_alerts" => "copywriter#preview_business_alerts"
              match "/copywriter/approved_meal" => "copywriter#approved_meal"
              match "/copywriter/add_comment" => "copywriter#add_comment"

             
              match "/restaurants/dashboard" => "restaurants#dashboard"
              match "/restaurants/update_email" => "restaurants#update_email"
              match "/restaurants/update_phone" => "restaurants#update_phone"
              match "/restaurants/update_password" => "restaurants#update_password"

#              match "/restaurant_edit" =>"manager#restaurant_edit"
#              match "/approved_deal" =>"manager#approved_deal"
#              match"/manager/restaurants_approved"=>"manager#restaurants_approved"
#              match"/manager/restaurants_delete"=>"manager#restaurants_delete"
#              match"/manager/permanent_delete"=>"manager#permanent_delete"
#              match"/manager/partially_delete"=>"manager#partially_delete"
#              match "/view_meal" =>"manager#view_meal"
#              match "/approved_dishes" =>"manager#approved_dishes"
#              match "/add_comment" =>"manager#add_comment"
#              match "/manager/dashboard" => "manager#dashboard"
#               match "/manager/approverequest" => "manager#dashboard" , :as => :dashboard


  ##### restaurants routes

        post  "restaurants/create" => "restaurants#create"
        post  "restaurants/approved" => "restaurants#approved"
        get   "restaurants/" => "restaurants#list"
        get   "/admin/restaurants/:id" => 'restaurants#show', :as => :restaurant
        get   "/admin/restaurants/:id/edit" => "restaurants#edit", :as => :edit_restaurant
        post   "/admin/restaurants/:id/edit" => "restaurants#edit_process"
        post   "/admin/restaurants/cluster" => "restaurants#find_cluster"
        match "/restaurants/restaurant_comment"=>"restaurants#restaurant_comment"
        match"/restaurants/delete"=>"restaurants#delete"
         match"/restaurants/delete_meal"=>"restaurants#delete_meal"
        match "/restaurants/get_sch" => "restaurants#get_sch"
        match"/restaurants/my_deals_library"=>"restaurants#my_deals_library"
        match "/reject_copywriter" => "restaurants#reject_copywriter"
        match"/restaurants/my_account"=>"restaurants#my_account"
        match"/restaurants/order_history"=>"restaurants#order_history"
        match"/restaurants/schedule"=>"restaurants#schedule"
        match"/restaurants/add_deal"=>"restaurants#add_deal"
        match"/restaurants/deals_pipeline"=>"restaurants#deals_pipeline"
        match"/restaurants/preview"=>"restaurants#preview"
        match"/restaurants/manage_locations"=>"restaurants#manage_locations"




  ####   manager routes
                match "/manager/scheduler"=>"manager#scheduler"
              match "/manager/approval"=>"manager#approval"
              match "/manager/feedback"=>"manager#feedback"
              match "/manager/pipeline"=>"manager#pipeline"
              match "/manager/portfolio"=>"manager#portfolio"

              match "manager/add_deal"=>"manager#add_deal"

            
              match "/manager/edit_review" => "manager#edit_review"
              match "/manager/add_comment" => "manager#add_comment"
       
              match "/restaurant_edit" =>"manager#restaurant_edit"
              match "/approved_deal" =>"manager#approved_deal"
              match"/manager/restaurants_approved"=>"manager#restaurants_approved"
              match"/manager/restaurants_delete"=>"manager#restaurants_delete"
              match"/manager/permanent_delete"=>"manager#permanent_delete"
              match"/manager/partially_delete"=>"manager#partially_delete"
              match "/view_meal" =>"manager#view_meal"
              match "/approved_dishes" =>"manager#approved_dishes"
              match "/manager/get_popup_asian/:date"=>"manager#get_popup_asian"
              match "/manager/get_popup_arabic/:date"=>"manager#get_popup_arabic"
              match "/manager/get_popup_american/:date"=>"manager#get_popup_american"
              match "/manager/get_popup_contiental/:date"=>"manager#get_popup_continental"

  
  match "/manager/get_popup_veg/:date"=>"manager#get_popup_veg"
              match "/manager/get_popup_other/:date"=>"manager#get_popup_other"
              match "/manager/get_popup_multicuisines/:date" => "manager#get_popup_multicuisines"
              match "/manager/getSchedule_popup" =>"manager#getSchedule_popup"
              match "/manager/get_popup_india/:date" => "manager#get_popup_india"
              match "/restaurants/getdealsinfo"=>"restaurants#getdealsinfo"  
       

   ### copywriter routes
              match "/copywriter/dashboard" => "copywriter#dashboard"
              match "/copywriter/edit_review" => "copywriter#edit_review"
              match "/copywriter/reject_restaurant_by_manager" => "copywriter#reject_restaurant_by_manager"
              match "/copywriter/approved_meal" => "copywriter#approved_meal"
              match "/copywriter/add_comment" => "copywriter#add_comment"

#              match "/restaurants/get_sch" => "restaurants#get_sch"
#              match  "/restaurants/addDeals"=> "restaurants#addDeals"
#              match"/restaurants/delete"=>"restaurants#delete"
#              match "/preview_business/:id" =>"restaurants#preview_business"
#
#              post  "restaurants/create" => "restaurants#create"
#              post  "restaurants/approve" => "restaurants#approve"
#              get   "restaurants/" => "restaurants#list"
#              get   "/admin/restaurants/:id" => 'restaurants#show', :as => :restaurant
#              get   "/admin/restaurants/:id/edit" => "restaurants#edit", :as => :edit_restaurant
#              post   "/admin/restaurants/:id/edit" => "restaurants#edit_process"
#              post   "/admin/restaurants/cluster" => "restaurants#find_cluster"
#              match "/reject_copywriter" => "restaurants#reject_copywriter"
#
              #  match "/manager/dashboard1" => "manager#dashboard1"
  #### super user
              get "superuser" => "superuser#dashboard", :as => "superuser"
              get "superuser/dashboard"
              match "/superuser/dashboard" => "superuser#dashboard"
              match "/superuser/new_cluster" => "superuser#new_cluster"
              match "superuser/cluster" => "superuser#new_cluster"
              match "superuser/cluster/:id" => "superuser#edit_cluster"
              match "superuser/edit_cluster/:id" => "superuser#edit_cluster"
              match "superuser/cluster" => "superuser#cluster_process"
              match "/superuser/edit_restaurant" => "superuser#edit_restaurant"
              get "superuser/edit_restaurant/:id" => "superuser#edit_restaurant"
              match "/restaurant_delete/:id" => "superuser#restaurant_delete"
              match "/edit" => "superuser#edit"
              get  "superuser/newpw"
              post "superuser/newpw" => "superuser#setpw"
              get  "superuser/newpw"
              post "superuser/newpw" => "superuser#setpw"
              post "superuser/approve" => "superuser#approve" # approve user
              get "superuser/approve" => "superuser#approve_by_email"
              get "superuser/new" => "superuser#new", :as => :new_admin
              get "superuser/edit/:id" => "superuser#edit", :as => :edit_admin
              post "superuser/edit/:id" => "superuser#edit_process"
              post "superuser/create" => "superuser#new_process"
              get "superuser/cluster/:id" => "superuser#edit_cluster", :as => :new_cluster
              post "superuser/cluster" => "superuser#cluster_process"
              post "/create_new_admin" => "superuser#create_new_admin"
              post "/superuser/edit_cluster" => "superuser#edit_cluster"
              get "/delete_admin/:id" => "superuser#delete_admin"
              get "/delete_cluster/:id" => "superuser#delete_cluster"

              match "/restaurants/restaurant_comment"=>"restaurants#restaurant_comment"

              # only for web services.......................
              match "todays_offer" => "webservice#todays_offer"
              match  "todaysdealoffer/:id" => "webservice#todaysdealoffer", :as => :todaysdealoffer
              match "about_us" => "webservice#about_us"
              match "web_cusines"  =>"webservice#web_cusines"
              match "web_login" => "webservice#web_login"
              match "web_logout" => "webservice#web_logout"
              match "web_offers" => "webservice#web_offers"
              match "web_signup/:email" => "webservice#web_signup"
              match "web_dmeal" => "webservice#web_Dmeal"
              match "web_singup" => "webservice#web_singup"
              match  "offers/:id" => "webservice#offers", :as => :offers
              match  "web_user/:id" => "webservice#web_user", :as =>:web_user
              match "cuisines" => "webservice#cuisines"
              match "delivery_loction/:first_name" => "webservice#delivery_loction" ,:as =>:delivery_loction
              match "updateuser" => "webservice#updateuser"
              match "addlocation" => "webservice#add_location"
              match "updateuser" => "webservice#updateuser"
              match "getallclusters"=> "webservice#getallclusters"
              match "location" => "webservice#location"
              ##############################user
              #match "front_page/:id" => "user_page#front_page"
              match "user_page_home/:id" => "user_page#user_page_home"
              get "/showdetails/:id" => "user_page#showdetails"

             
end
