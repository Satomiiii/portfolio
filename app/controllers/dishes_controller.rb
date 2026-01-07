class DishesController < ApplicationController
  # skip_before_action :authenticate_user!, raise: false

  def index
    @q = params[:q].to_s.strip
    @category = params[:category].to_s.strip

    @dishes = Dish.all.order(created_at: :desc)

    if @q.present?
      @dishes = @dishes.where("name LIKE ?", "%#{@q}%")
    end

    if @category.present?
      @dishes = @dishes.where(category: @category)
    end

    @categories = Dish.distinct.order(:category).pluck(:category)
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
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :category, :memo)
  end
end
