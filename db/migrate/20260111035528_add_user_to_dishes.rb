class AddUserToDishes < ActiveRecord::Migration[6.1]
  def up
    # ① まずは null を許可して追加
    add_reference :dishes, :user, null: true, foreign_key: true

    # ② 既存データの user_id を埋める（最初のユーザーを使う）
    #    ※ name カラムが無いので email/password のみで作る
    user =
      User.first ||
      User.create!(
        email: "demo@example.com",
        password: "password",
        password_confirmation: "password"
      )

    Dish.where(user_id: nil).update_all(user_id: user.id)

    # ③ 最後に null:false にする
    change_column_null :dishes, :user_id, false
  end

  def down
    remove_reference :dishes, :user, foreign_key: true
  end
end
