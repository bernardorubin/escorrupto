class TargetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy, :update]
  before_action :find_target, only: [:show, :edit, :destroy, :update]
  before_action :authorize, only: [:edit, :destroy, :update]

  def new
    @target = Target.new
    @locations = ['Querétaro', 'DF']
  end

  def create
    @target = Target.new(target_params)
    if @target.save
      flash[:notice] = 'Creado'
      redirect_to target_path (@target)
    else
      flash.now[:alert] = 'Arregla las cosas'
      render :new
    end
  end

  def show
    # render json:params
  end

  def index
    # @targets = Target.all.latest_first
    @targets =  Target.left_joins(:likes)
                       .group(:id)
                       .order('COUNT(likes.id) DESC')
                       .limit(10)
  end

  # def edit
  # end

  def update
    if cannot?(:update, @target)
      redirect_to targets_path, alert: 'No Autorizado'
    else
      if @target.update target_params
        redirect_to target_path(@target), notice: 'Actualizado'
      else
        render :edit
      end
    end
  end

  # def destroy
  #   if cannot?(:destroy, @target)
  #     redirect_to targets_path, alert: 'No Autorizado a eliminar tus solicitudes'
  #   else
  #     @target.destroy
  #     redirect_to targets_path, notice: 'Solicitud eliminada'
  #   end
  # end

  private

  def authorize
    if cannot?(:manage, @target)
      redirect_to targets_path, alert: 'No Autorizado'
    end
  end

  def target_params
    params.require(:target).permit([:name, :profession, :position, :location])
  end

  def find_target
    # @target = Target.find params[:id]
    begin
      @target ||= Target.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to targets_path, alert: "ID Not Found"
    end
  end

end
