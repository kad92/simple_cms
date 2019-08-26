class AdminUsersController < ApplicationController
	layout "admin"

	def index
		@admin_users = AdminUser.sorted
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
	end
end
