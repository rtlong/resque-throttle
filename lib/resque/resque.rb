require "resque/throttle"

module Resque
  extend self

  # Raised when trying to create a job that is throttled
  class ThrottledError < RuntimeError; end
      
  def enqueue_with_throttle(klass, *args)
    if should_throttle?(klass, *args)
      unless klass.throttle_settings[:silent]
        raise(
          ThrottledError,
          "#{klass} with key #{klass.key(*args)} has exceeded it's throttle limit"
        )
      end
    else
      enqueue_without_throttle(klass, *args)
    end
  end
  alias_method :enqueue_without_throttle, :enqueue
  alias_method :enqueue, :enqueue_with_throttle

  private
   
  def should_throttle?(klass, *args)
    return false if !throttle_job?(klass) || klass.disabled
    return true if key_found?(klass, *args)
    redis.setex(klass.key(*args), klass.can_run_every, true)
    return false
  end

  def key_found?(klass, *args)
     redis.get(klass.key(*args))
  end

  def throttle_job?(klass)
    klass.ancestors.include?(Resque::ThrottledJob)  
  end
end