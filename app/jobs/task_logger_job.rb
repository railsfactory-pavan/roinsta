class TaskLoggerJob < ApplicationJob
  sidekiq_options queue: :default, retry: 3
  queue_as :default

  before_perform :print_before_perform_message
  after_perform :print_after_perform_message

  before_enqueue :print_before_enqueue_message
  after_enqueue :print_after_enqueue_message

  def perform task
    puts "Created a task with following attributes :: #{task.attributes}"
  end

  def print_before_perform_message
    puts "Printing from inside before_perform callback"
  end

  def print_after_perform_message
    puts "Printing from inside after_perform callback"
  end

  def print_before_enqueue_message
    puts "Printing from inside before_enqueue callback"
  end

  def print_after_enqueue_message
    puts "Printing from inside after_enqueue callback"
  end
end
