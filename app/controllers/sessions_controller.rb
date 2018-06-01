class SessionsController < ApplicationController
    def create 
        user = User.find_by_email(params[:email])

        if user && user.valid_password?(params[:password])
            render json: user, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        user = User.find_by(authentication_token: params[:authentication_token])
        user.update_attribute(:authentication_token, nil)

    end
    
end
