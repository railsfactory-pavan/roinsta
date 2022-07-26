class Task < ApplicationRecord
  after_create :log_task_details

  def log_task_details
    TaskLoggerJob.perform_now(self)
  end
end
