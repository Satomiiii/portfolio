class DishesController < ApplicationController
  before_action :set_dish, only: [ :show, :edit, :update, :destroy ]

  def index
    @dishes =
      Dish.left_joins(:cook_logs)
          .select("dishes.*, COUNT(cook_logs.id) AS cook_logs_count, MAX(cook_logs.created_at) AS last_cooked_at")
          .group("dishes.id")
          .order(Arel.sql("last_cooked_at IS NULL ASC, last_cooked_at DESC, dishes.created_at DESC"))
  end

  def show
    @cook_logs = @dish.cook_logs.order(trial_number: :desc, created_at: :desc)
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path, notice: "料理を登録しました"
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to dishes_path, notice: "料理を更新しました"
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_path, notice: "料理を削除しました"
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :category, :memo)
  end
end
