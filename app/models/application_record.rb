# frozen_string_literal: true

# Top level Record
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
