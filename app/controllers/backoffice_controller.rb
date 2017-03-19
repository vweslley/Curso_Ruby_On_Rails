class BackofficeController < ApplicationController
  before_action :authenticate_admin!
  layout "backoffice"

  def pundit_user
      current_admin # Troca o current_user do Pundit para nosso current_admin
  end
end