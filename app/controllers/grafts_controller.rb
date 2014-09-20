class GraftsController < ApplicationController
	before_action :render_layout_if_html

	def index
		@grafts = Graft.all
		render json: @grafts
	end

	private
		def render_layout_if_html
			if request.format.symbol == :render_layout_if_html
				render "layouts/application"
			end
		end

end