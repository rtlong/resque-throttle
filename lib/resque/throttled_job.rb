module Resque
  class SettingNotFound < RuntimeError; end

  class ThrottledJob

    THROTTLE_DEFAULTS = {
        :can_run_every => 1800,
        :disabled      => false,
    }

    def self.throttle_settings
      @throttle_settings ||= THROTTLE_DEFAULTS.dup
    end

    def self.throttle(args = {})
      throttle_settings.merge!(args)
    end

    def self.identifier(*args)
    end

    def self.key(*args)
      ['resque-throttle', self.to_s, identifier(*args)].compact.join(":")
    end

    def self.can_run_every
      throttle_settings[:can_run_every]
    end

    def self.disabled
      throttle_settings[:disabled]
    end
  end
end