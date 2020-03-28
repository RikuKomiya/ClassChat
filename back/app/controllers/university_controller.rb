class UniversityController < ApplicationController
  def index
    @universities = University.all
  end

  def show

  end
end
