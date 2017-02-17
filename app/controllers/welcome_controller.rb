class WelcomeController < ApplicationController
  def index
    flash[:notice] = "沙明！你好！"
  end
end
