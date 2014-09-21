class GraftsController < ApplicationController
	before_action :render_layout_if_html

	def index
		@user = User.all
		render json: @users
	end

	def create
		render json: User.create(user_params)
	end

	private
	
		def user_params
			params.require(:user).permit(:name, :email, :zipcode, :cids, :notes)
		end

		def render_layout_if_html
			if request.format.symbol == :html
				render "layouts/application"
			end
		end

end