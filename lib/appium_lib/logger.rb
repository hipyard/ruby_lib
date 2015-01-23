require 'logger'

module Appium
  module Logger
    class << self
      extend Forwardable
      def_delegators :logger, :ap, :fatal, :error, :warn, :info, :debug, :level, :level=, :formatter, :formatter=

    private
    
      def logger
        @logger ||= begin
          logger = ::Logger.new($stdout)
          logger.formatter = proc { |severity, datetime, progname, msg| "#{msg}\n" } # do no special formatting
          logger
        end
      end
    end # class << self
  end # module Logger
end # module Appium