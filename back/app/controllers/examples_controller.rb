class ExamplesController < ApplicationController
    def index
        example = Example.all.select(:id,:name,:color)
        render json: example
    end
end
