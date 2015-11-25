# Class HomeController
class HomeController < ApplicationController
  def index
    @usuarios = User.all
  end
end
