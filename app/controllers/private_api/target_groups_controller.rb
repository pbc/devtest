module PrivateApi
  class TargetGroupsController < BaseTargetGroupsController
    include PrivateApiAuthentication
  end
end