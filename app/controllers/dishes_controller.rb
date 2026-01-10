class DishesController < ApplicationController
  before_action :set_dish, only: [ :edit, :update, :destroy ]

  def index
    @dishes = Dish.order(created_at: :desc)
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path, notice: "料理を登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dish.update(dish_params)
      redirect_to dishes_path, notice: "料理を更新しました"
    else
      render :edit
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
