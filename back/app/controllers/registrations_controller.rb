class RegistrationsController < Devise::RegistrationsController
  include ActionController::MimeResponds
  respond_to :json
  def create
    super
	end

	def show

	end
		
	
end