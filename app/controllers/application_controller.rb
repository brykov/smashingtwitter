class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :choose_layout

  def choose_layout
    if params[:ajax]
      nil
    else
      'application'
    end
  end

  # workaround for some strange exception
  def controller
    self.class
  end
end
