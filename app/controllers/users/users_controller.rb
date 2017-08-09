class UsersController < ApplicationController
	def show
	  @rooms = User.find(params[ :id])
	end
end