class GoalReminderMailer < ApplicationMailer
  default from: "app.squadgoals@gmail.com"

  def goal_reminder(user, goal)
    @user = user
    @goal = goal
    mail(to: @user.email, subject: "Goal Reminder")
  end
end
