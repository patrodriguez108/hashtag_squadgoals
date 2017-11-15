# Preview all emails at http://localhost:3000/rails/mailers/goal_reminder
class GoalReminderPreview < ActionMailer::Preview
  def goal_reminder_preview
    GoalReminderMailer.goal_reminder(User.first, User.first.goals.first)
  end
end
