class SessionsController < ApplicationController

    def new
        #nothing to do here other than render new.html.erb
   end
   
   def create
   #Not using an instance variable since
   #we're not providing the user to a view
   user = User.find_by(email: params[:email])
   #taking advantage of the && logical operator's
   # short-circuiting
   if user && user.authenticate(params[:password])
       #sucessful log in
       session[:user_id] = user.id
       redirect_to root_path, notice: 'Logged in!'
   else
       #flahs.now is used for messaging
       #during the CURRENT request
       flash.now.alert = 'Invalid login credentials - try again!'
       render new
   end
end
   def destroy
       session[:user_id] = nil
       redirect_to root_path, notice: "Logged out!"
   end
end