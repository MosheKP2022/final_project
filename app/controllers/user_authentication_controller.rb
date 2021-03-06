class UserAuthenticationController < ApplicationController
  # Uncomment line 3 in this file and line 5 in ApplicationController if you want to force users to sign in before any other actions.
  skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def home
    render({ :template => "user_authentication/home_page.html.erb" })
  end
  
  def sign_in_form
    render({ :template => "user_authentication/sign_in.html.erb" })
  end

  def create_cookie
    user = User.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user != nil
      are_they_legit = user.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_id] = user.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_sign_in", { :alert => "No user with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    @user = User.new
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    #@user.profile_picture = params.fetch("query_profile_picture")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.about_me = params.fetch("query_about_me")
    @user.phone = params.fetch("query_phone")
    @user.address = params.fetch("query_address")
    @user.kids1_age = params.fetch("query_kids1_age")
    @user.kids3_age = params.fetch("query_kids3_age")
    @user.kids4_age = params.fetch("query_kids4_age")
    @user.kids5_age = params.fetch("query_kids5_age")
    @user.kids6_age = params.fetch("query_kids6_age")
    #@user.private = params.fetch("query_private", false)
    @user.kids2_age = params.fetch("query_kids2_age")

    save_status = @user.save

    if save_status == true
      session[:user_id] = @user.id
   
      redirect_to("/", { :notice => "User account created successfully."})
    else
      redirect_to("/user_sign_up", { :alert => @user.errors.full_messages.to_sentence })
    end
  end
    
  def edit_profile
    render({ :template => "user_authentication/edit_profile.html.erb" })
  end

  def profile_dashboard
    @user_offerings = Offering.where({:giver_id => @current_user.id}).order(:created_at=> :desc)
    @user_comments = Comment.where({:commenter_id => @current_user.id}).order(:created_at=> :desc)

    #@list_of_offerings = matching_offerings.order({ :created_at => :desc })

    render({ :template => "user_authentication/profile_dashboard.html.erb" })
  end

  def update
    @user = @current_user
    @user.email = params.fetch("query_email")
    @user.password = params.fetch("query_password")
    @user.password_confirmation = params.fetch("query_password_confirmation")
    #@user.profile_picture = params.fetch("query_profile_picture")
    @user.first_name = params.fetch("query_first_name")
    @user.last_name = params.fetch("query_last_name")
    @user.about_me = params.fetch("query_about_me")
    @user.phone = params.fetch("query_phone")
    @user.address = params.fetch("query_address")
    @user.kids1_age = params.fetch("query_kids1_age")
    @user.kids3_age = params.fetch("query_kids3_age")
    @user.kids4_age = params.fetch("query_kids4_age")
    @user.kids5_age = params.fetch("query_kids5_age")
    @user.kids6_age = params.fetch("query_kids6_age")
    #@user.private = params.fetch("query_private", false)
    @user.kids2_age = params.fetch("query_kids2_age")
    @user.offerings_count = params.fetch("query_offerings_count")
    @user.comments_count = params.fetch("query_comments_count")
    @user.messages_to_administrators_count = params.fetch("query_messages_to_administrators_count")
    
    if @user.valid?
      @user.save

      redirect_to("/", { :notice => "User account updated successfully."})
    else
      render({ :template => "user_authentication/edit_profile_with_errors.html.erb" , :alert => @user.errors.full_messages.to_sentence })
    end
  end

  def destroy
    @current_user.destroy
    reset_session
    
    redirect_to("/", { :notice => "User account cancelled" })
  end
 
end
