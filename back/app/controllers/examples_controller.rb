class ExamplesController < ApplicationController
	before_action :authenticate_user!

	def index
			example = Example.all.select(:id,:name,:color)
			render json: example
	end
end
