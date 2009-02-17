require 'helperful'

ActionController::Base.extend Helperful::ControllerMixin

RAILS_DEFAULT_LOGGER.info("** Helperful: initialized properly") if defined?(RAILS_DEFAULT_LOGGER)
