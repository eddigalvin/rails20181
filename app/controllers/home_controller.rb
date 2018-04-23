class HomeController < ApplicationController
  
  include Usercart
  before_action :set_cart
  before_action :current_user
  def index
    @user = current_user
  end

end
