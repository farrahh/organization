class AdminController < ApplicationController
  before_action :check_status




  def add
       redirect_to "/show"
    end



  private

    def check_status
      if !session[:user_id]
        redirect_to '/'
      end
  end
  end
end
