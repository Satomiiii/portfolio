class CookLogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dish
  before_action :set_cook_log, only: [ :edit, :update, :destroy ]

  def new
    @cook_log = @dish.cook_logs.new(trial_number: next_trial_number)
  end

  def create
    @cook_log = @dish.cook_logs.new(cook_log_params)
    @cook_log.user = current_user

    if @cook_log.save
      redirect_to dish_path(@dish), notice: "ログを追加しました"
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cook_log.update(cook_log_params)
      redirect_to dish_path(@dish), notice: "ログを更新しました"
    else
      flash.now[:alert] = "入力内容を確認してください"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cook_log.destroy
    redirect_to dish_path(@dish), notice: "ログを削除しました"
  end

  private

  def set_dish
    @dish = current_user.dishes.find(params[:dish_id])
  end

  def set_cook_log
    @cook_log = @dish.cook_logs.find(params[:id])
  end

  def cook_log_params
    params.require(:cook_log).permit(:trial_number, :reflection, :next_plan)
  end

  def next_trial_number
    max = @dish.cook_logs.maximum(:trial_number)
    max.present? ? max + 1 : 1
  end
end
