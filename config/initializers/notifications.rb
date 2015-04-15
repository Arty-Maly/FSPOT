ActiveSupport::Notifications.subscribe('render') do |name, start, finish, id, payload|
  name    # => String, name of the event (such as 'render' from above)
  start   # => Time, when the instrumented block started execution
  finish  # => Time, when the instrumented block ended execution
  id      # => String, unique ID for this notification
  payload # => Hash, the payload
end

