class AccountsController < ApplicationController
    before_action :set_account, only: %i[ show update destroy ]
    skip_before_action :authenticate_request, only: :create
    def index
      @accounts = Account.all
      render json: @accounts
    end
    def show
      render json: @account
    end
    def new
      @account = Acount.new
    end
    def create
      @account = Account.new(account_params)
      if @account.save
        render json: @account, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
    def update
      if @account.update(account_params)
        render json: @account, status: :created
      else
        render json: @account.errors, status: :unprocessable_entity
      end
    end
    def destroy
      @account.destroy!
      render json: {message: "Succesfully Deleted!"}
    end
    private
      def set_account
        @account = Account.find(params[:id])
      end
      def account_params
        params.permit(:username, :email, :password, :unique_auth_id)
      end
  end