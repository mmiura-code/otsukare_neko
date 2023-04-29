# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
#以下かくとcarrierwavve実装時のエラー解消
require 'carrierwave/orm/activerecord'
