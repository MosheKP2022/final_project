Rails.application.routes.draw do

  get("/", { :controller => "user_authentication", :action => "home" })      
 
  # Routes for the Labeled offering resource:

  # CREATE
  post("/insert_labeled_offering", { :controller => "labeled_offerings", :action => "create" })
          
  # READ
  get("/labeled_offerings", { :controller => "labeled_offerings", :action => "index" })
  
  get("/labeled_offerings/:path_id", { :controller => "labeled_offerings", :action => "show" })
  
  # UPDATE
  
  post("/modify_labeled_offering/:path_id", { :controller => "labeled_offerings", :action => "update" })
  
  # DELETE
  get("/delete_labeled_offering/:path_id", { :controller => "labeled_offerings", :action => "destroy" })

  #------------------------------

  # Routes for the Tag resource:

  # CREATE
  post("/insert_tag", { :controller => "tags", :action => "create" })
          
  # READ
  get("/tags", { :controller => "tags", :action => "index" })
  
  get("/tags/:path_id", { :controller => "tags", :action => "show" })
  
  # UPDATE
  
  post("/modify_tag/:path_id", { :controller => "tags", :action => "update" })
  
  # DELETE
  get("/delete_tag/:path_id", { :controller => "tags", :action => "destroy" })

  #------------------------------

  # Routes for the Messages to administrator resource:

  # CREATE
  post("/insert_messages_to_administrator", { :controller => "messages_to_administrators", :action => "create" })
          
  # READ
  get("/messages_to_administrators", { :controller => "messages_to_administrators", :action => "index" })
  
  get("/messages_to_administrators/:path_id", { :controller => "messages_to_administrators", :action => "show" })
  
  # UPDATE
  
  post("/modify_messages_to_administrator/:path_id", { :controller => "messages_to_administrators", :action => "update" })
  
  # DELETE
  get("/delete_messages_to_administrator/:path_id", { :controller => "messages_to_administrators", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Offering resource:

  get("/new_offering_form", { :controller => "offerings", :action => "new_offering_form" })

  # CREATE
  post("/insert_offering", { :controller => "offerings", :action => "create" })
          
  # READ
  get("/offerings", { :controller => "offerings", :action => "index" })

  
  
  get("/offerings/:path_id", { :controller => "offerings", :action => "show" })
  
  # UPDATE
  
  post("/modify_offering/:path_id", { :controller => "offerings", :action => "update" })
  
  # DELETE
  get("/delete_offering/:path_id", { :controller => "offerings", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "user_authentication", :action => "sign_up_form" })        


  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
