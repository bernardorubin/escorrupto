class TargetsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_target, only: [:show, :edit, :destroy, :update]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @target = Target.new
    # @locations = ['yes', 'no']
  end

  def create
    @target = Target.new(target_params)
    @target.user_id = current_user.id
    if @target.save
      flash[:notice] = 'Creado'
      redirect_to requisition_path (@target)
    else
      flash.now[:alert] = 'Arregla las cosas'
      render :new
    end
  end

  def show
    # render json:params
  end

  def index
    @targets = Target.all.latest_first
  end

  # def edit
  # end

  # def update
  #   if cannot?(:update, @requisition)
  #     redirect_to requisitions_path, alert: 'No Autorizado a editar solicitudes que no son tuyas'
  #   else
  #     if @requisition.update target_params
  #       redirect_to requisition_path(@requisition), notice: 'Solicitud actualizada'
  #     else
  #       render :edit
  #     end
  #   end
  # end

  # def destroy
  #   if cannot?(:destroy, @requisition)
  #     redirect_to requisitions_path, alert: 'No Autorizado a eliminar tus solicitudes'
  #   else
  #     @requisition.destroy
  #     redirect_to requisitions_path, notice: 'Solicitud eliminada'
  #   end
  # end

  private

  # def authorize
  #   if cannot?(:manage, @requisition)
  #     redirect_to requisitions_path, alert: 'No Autorizado a leer solicitudes que no son tuyas'
  #   end
  # end

  # def target_params
  #   params.require(:target).permit(:income, :address_years])
  # end

  # def find_target
  #   # @target = Target.find params[:id]
  #   begin
  #     @target ||= Target.find(params[:id])
  #   rescue ActiveRecord::RecordNotFound
  #     redirect_to corrupts_path, alert: "ID Not Found"
  #   end
  # end

end
