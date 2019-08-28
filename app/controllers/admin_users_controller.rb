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
      @admin_user = AdminUser.new(admin_user_params)

      if @admin_user.save
        flash[:notice] = "#{@admin_user.name}created successfully!"
        redirect_to(:action => 'index')
      else
        render 'new'
      end
    end

    def edit
      @admin_user = AdminUser.find(params[:id])
    end

    def update
      @admin_user = AdminUser.find(params[:id])

      if @admin_user.update_attributes(admin_user_params)
        flash[:notice] = "#{@admin_user.first_name}'s info have been updated successfully."
        redirect_to(:action => 'index')
      else
        render 'edit'
      end

    end

    def delete
      @admin_user = AdminUser.find(params[:id])
    end

    def destroy
      admin_user = AdminUser.find(params[:id])

      admin_user.destroy

      flash[:notice] = "#{admin_user.name} has been deleted from admin users."

      if admin_user.id == session[:user_id]
        session[:user_id] = nil
        session[:username] = nil

        redirect_to(:controller => 'access',:action => 'login')
      else
        redirect_to(:action => 'index')
      end
    end

    private

      def admin_user_params
        params.require(:admin_user).permit(:first_name,:last_name,:email,:username,:password, :password_confirmation)
      end
end
