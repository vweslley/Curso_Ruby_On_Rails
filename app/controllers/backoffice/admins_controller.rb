class Backoffice::AdminsController < BackofficeController
  before_action :set_admin, only: [:edit, :update, :destroy]
  after_action  :verify_authorized, only: :new
  after_action  :verify_policy_scoped, only: :index
  def index
    #@admin = Admin.all
    #@admin = Admin.with_full_access
    @admin = policy_scope(Admin)
  end
  def new
      @admin = Admin.new
      authorize @admin
  end
  def create
      @admin = Admin.new(params_admin)
      if @admin.save
        redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.email}) foi cadastrada com sucesso."
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      AdminMailer.update_email(current_admin, @admin).deliver_now
     redirect_to backoffice_admins_path, notice: "O Administrador (#{@admin.email}) foi atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    authorize @admin
    if  @admin.destroy
      admin_email = @admin.email
      redirect_to backoffice_admins_path, notice: "O Administrador (#{admin_email}) foi apagado com sucesso."
    else
      render :index
    end
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
      passwd = params[:admin][:password]
      passwd_confirmation = params[:admin][:password_confirmation]

    if passwd.blank? && passwd_confirmation.blank?
      params[:admin].except!(:password, :password_confirmation)
    end

    unless @admin.blank?
      params.require(:admin).permit(policy(@admin).permitted_attributes)
    else
      params.require(:admin).permit(:name, :email, :role, :password, :password_confirmation)
    end
  end
end