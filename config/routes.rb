Rails.application.routes.draw do

  # Routes for the Question resource:

  # CREATE
  post("/insert_question", { :controller => "questions", :action => "create" })
          
  # READ
  get("/questions", { :controller => "questions", :action => "index" })
  
  get("/questions/:path_id", { :controller => "questions", :action => "show" })
  
  # UPDATE
  
  post("/modify_question/:path_id", { :controller => "questions", :action => "update" })
  
  # DELETE
  get("/delete_question/:path_id", { :controller => "questions", :action => "destroy" })

  #------------------------------

  # Routes for the Interview formats entry resource:

  # CREATE
  post("/insert_interview_formats_entry", { :controller => "interview_formats_entries", :action => "create" })
          
  # READ
  get("/interview_formats_entries", { :controller => "interview_formats_entries", :action => "index" })
  
  get("/interview_formats_entries/:path_id", { :controller => "interview_formats_entries", :action => "show" })
  
  # UPDATE
  
  post("/modify_interview_formats_entry/:path_id", { :controller => "interview_formats_entries", :action => "update" })
  
  # DELETE
  get("/delete_interview_formats_entry/:path_id", { :controller => "interview_formats_entries", :action => "destroy" })

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

  # Routes for the Interview question entry resource:

  # CREATE
  post("/insert_interview_question_entry", { :controller => "interview_question_entries", :action => "create" })
          
  # READ
  get("/interview_question_entries", { :controller => "interview_question_entries", :action => "index" })
  
  get("/interview_question_entries/:path_id", { :controller => "interview_question_entries", :action => "show" })
  
  # UPDATE
  
  post("/modify_interview_question_entry/:path_id", { :controller => "interview_question_entries", :action => "update" })
  
  # DELETE
  get("/delete_interview_question_entry/:path_id", { :controller => "interview_question_entries", :action => "destroy" })

  #------------------------------

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

  # Routes for the Interview format resource:

  # CREATE
  post("/insert_interview_format", { :controller => "interview_formats", :action => "create" })
          
  # READ
  get("/interview_formats", { :controller => "interview_formats", :action => "index" })
  
  get("/interview_formats/:path_id", { :controller => "interview_formats", :action => "show" })
  
  # UPDATE
  
  post("/modify_interview_format/:path_id", { :controller => "interview_formats", :action => "update" })
  
  # DELETE
  get("/delete_interview_format/:path_id", { :controller => "interview_formats", :action => "destroy" })

  #------------------------------

  # Routes for the Role resource:

  # CREATE
  post("/insert_role", { :controller => "roles", :action => "create" })
          
  # READ
  get("/roles", { :controller => "roles", :action => "index" })
  
  get("/roles/:path_id", { :controller => "roles", :action => "show" })
  
  # UPDATE
  
  post("/modify_role/:path_id", { :controller => "roles", :action => "update" })
  
  # DELETE
  get("/delete_role/:path_id", { :controller => "roles", :action => "destroy" })

  #------------------------------

  # Routes for the Company role resource:

  # CREATE
  post("/insert_company_role", { :controller => "company_roles", :action => "create" })
          
  # READ
  get("/company_roles", { :controller => "company_roles", :action => "index" })
  
  get("/company_roles/:path_id", { :controller => "company_roles", :action => "show" })
  
  # UPDATE
  
  post("/modify_company_role/:path_id", { :controller => "company_roles", :action => "update" })
  
  # DELETE
  get("/delete_company_role/:path_id", { :controller => "company_roles", :action => "destroy" })

  #------------------------------

get("/", {:controller=>"homepage", :action=>"homepage"})

end
