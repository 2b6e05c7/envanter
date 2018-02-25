require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Sorted that suitable with relationships
    fixtures(
      :users,
      :groups,
      :memberships,
      :templates,
      :products
    )
  end
end
