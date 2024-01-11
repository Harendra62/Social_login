class SocialAccountsController < ApplicationController
    skip_before_action :authenticate_request
#     def google_login
#         # debugger
#       data, res = AccountService.get_data(params)
#       if res.is_a?(Net::HTTPSuccess)
#         unless SocialAccount.find_by(unique_auth_id: data["sub"]).present?
#             google_login_result(params, data)
#         else 
#             render json: {error: "account already present"}, status: :unprocessable_entity
#         end
#     else 
#         render json: {errors: data}, status: :unprocessable_entity
#     end
   
# end

def google_login
    data, res = AccountService.get_data(params)
    if params[:access_token].present?
      if data.key?("errors")
        render json: { errors: "Failed to fetch user data from Google." }, status: :unprocessable_entity
      else
        account = SocialAccount.new(email: data["email"], unique_auth_id: data["sub"])
        if account.save
          render json: account, status: :ok
        else
          render json: { errors: account.errors }, status: :unprocessable_entity
        end
      end
    else
      render json: { errors: "Access token not provided" }, status: :unprocessable_entity
    end
  end
end
