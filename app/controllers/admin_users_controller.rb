class AdminUsersController < ApplicationController
	layout "admin"

  before_action :confirm_logged_in

    def index
      @admin_users = AdminUser.sorted
    end

    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new()
    end

    def edit
    end

    def update
    end

    def delete
    end

    def destroy
    end

    private

      def admin_user_params
        params.require[:admin_user].permit(:first_name,:last_name,:email,:username,:password)
      end
end
