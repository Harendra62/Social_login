class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request
    def login
       
        @account = Account.find_by(email: params[:email])
        if @account&.authenticate(params[:password])
          token = Jsonwebtoken.encode(account_id: @account.id)
          render json: { token: token }, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
    end
end

