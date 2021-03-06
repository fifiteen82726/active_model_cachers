# frozen_string_literal: true
require 'active_model_cachers/version'
require 'active_model_cachers/config'
require 'active_model_cachers/cache_service_factory'
require 'active_record'
require 'active_record/relation'
require 'active_model_cachers/active_record/extension'

module ActiveModelCachers
  def self.config
    @config ||= Config.new
    yield(@config) if block_given?
    return @config
  end
end

ActiveRecord::Base.send(:extend, ActiveModelCachers::ActiveRecord::Extension)
