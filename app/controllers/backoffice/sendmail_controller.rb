class Backoffice::SendmailController < ApplicationController
  def edit
    @admin = Admin.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    begin
      @notify_message = "Email Enviado com Sucesso"
      @notify_flag = "success"
      AdminMailer.send_message(current_admin, params[:'recipient-text'],
                  params[:'subject-tex'], params[:'message-text']).deliver_now
    rescue
     @notify_message = "Erro ao enviar o e-mail"
     @notify_flag = "error"
    end
    respond_to do |format|
      format.js
    end
  end
end