require 'active_support'
require 'active_support/core_ext/object/blank'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
