class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all 
  end

  def show
    @lecture = Lecture.find(params[:id])
    @messages = @lecture.messages
  end
end
