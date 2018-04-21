class HomeController < ApplicationController
  
  include Usercart
  before_action :set_cart
  def index
  end

end
