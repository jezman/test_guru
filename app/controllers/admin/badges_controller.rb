class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :find_badges, only: :index
  before_action :find_badge, only: %i[show edit update destroy]

  def index; end

  def new
    @badge = Badge.new
  end

  def edit; end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: t('admin.created', resource: @badge.model_name.human)
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: t('admin.updated', resource: @badge.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy

    redirect_to admin_badges_path, notice: t('admin.deleted', resource: @badge.model_name.human)
  end

  private

  def find_badges
    @badges = Badge.all
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title,
                                  :image_path,
                                  :assigment_rule,
                                  :level,
                                  :category_id)
  end
end
