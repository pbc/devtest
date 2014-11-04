require 'rails_helper'

RSpec.describe TargetGroup, :type => :model do
  context "relationships" do
    it {should belong_to :parent_target_group}
    it {should belong_to :country}
    it {should belong_to :panel_provider}
  end
end
