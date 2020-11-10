class PropartiesController < ApplicationController
  def index
    @proparty = Proparty.all
  end
  def new
    @proparty = Proparty.new
  end
end
