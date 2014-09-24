class GraftsController < ApplicationController
	before_action :render_layout_if_html

	def index
		@user = User.all
		render json: @users
	end

	def create
		render json: User.create(user_params)
	end

	def find_legislators
		state_id = params[:state_id]
		puts "calling find_legislators with typheous"
		response = Typhoeus.get("http://www.opensecrets.org/api/?method=getLegislators&id="+state_id+"&apikey=372c032ce003d03628fd519bd97d5f7e&output=json")
		puts "results: " + response.body.to_s
		render json: response.body
	end

	def find_candidate_info
		cid = params[:cid]
		puts "calling individual legislator"
		response = Typhoeus.get("http://www.opensecrets.org/api/?method=candSummary&cid="+ cid +"&cycle=2012&apikey=372c032ce003d03628fd519bd97d5f7e&output=json")
		puts "results: " + response.body.to_s
		render json: response
	end

	private
	def user_params
		params[:name, :email, :zipcode, :cids, :notes]
	end

	def render_layout_if_html
		if request.format.symbol == :html
			render "layouts/application"
		end
	end
end