require 'httparty'
class AccountService
    class << self
      def get_data(params)
        begin
          uri = URI("https://www.googleapis.com/oauth2/v3/userinfo?access_token=#{params[:access_token]}")
          res = Net::HTTP.get_response(uri)
        rescue Exception => e
          render json: {errors: e}, status: :unprocessable_entity
        end
        data = JSON.parse(res.body)
        return data, res
      end
    end
end 