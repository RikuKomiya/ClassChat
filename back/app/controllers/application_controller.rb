class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  protect_from_forgery unless: -> { request.format.json? }
end
