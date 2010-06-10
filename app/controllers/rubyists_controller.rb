class RubyistsController < ApplicationController

  def index
    @rubyists = Rubyist.all
  end

  def show
    @rubyist = Rubyist.find(params[:id])
  end

end
