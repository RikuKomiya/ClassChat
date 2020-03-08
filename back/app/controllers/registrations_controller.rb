class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    super
	end

	def show

	end
		
	
end