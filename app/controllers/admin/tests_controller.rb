class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = current_user.tests_author.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('admin.created', resource: @test.model_name.human)
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('admin.updated', resource: @test.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path, notice: t('admin.deleted', resource: @test.model_name.human)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
