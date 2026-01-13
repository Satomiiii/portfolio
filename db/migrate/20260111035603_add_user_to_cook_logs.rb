class AddUserToCookLogs < ActiveRecord::Migration[6.1]
  def up
    add_reference :cook_logs, :user, null: true, foreign_key: true

    user =
      User.first ||
      User.create!(
        email: "demo@example.com",
        password: "password",
        password_confirmation: "password"
      )

    CookLog.where(user_id: nil).update_all(user_id: user.id)

    change_column_null :cook_logs, :user_id, false
  end

  def down
    remove_reference :cook_logs, :user, foreign_key: true
  end
end
