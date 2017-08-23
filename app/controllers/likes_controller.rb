class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_like, only: :destroy
  before_action :find_target, only: :create

  def create
    like = Like.new(user: current_user, target: @target)
    if cannot? :like, @target
      redirect_back fallback_location: targets_path, alert: 'Liking your own target is frowned upon'
      return
    end
    if like.save
      redirect_back fallback_location: targets_path, notice: 'Target liked! 👍'
    else
      redirect_back fallback_location: targets_path, alert: 'Couldn\'t like target 🤙'
    end
  end

  def destroy
    if can? :like, @like.target
      opts = nil
      @like.destroy ? opts = {notice: 'Target Un-liked 👎'} : opts = {alert: @like.errors.full_messages.join(', ')}
      redirect_back fallback_location: targets_path, **opts
    else
      redirect_back fallback_location: targets_path, alert: 'Un-Liking your own target isn\'t allowed'
    end
  end

  private

  def find_like
    @like ||= Like.find(params[:id])
  end

  def find_target
    @target ||= Target.find(params[:target_id])
  end
end
