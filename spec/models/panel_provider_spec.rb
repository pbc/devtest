require 'rails_helper'

RSpec.describe PanelProvider, :type => :model do
  context "relationships" do
    it {should have_many :countries}
    it {should have_many :location_groups}
    it {should have_many :locations}
  end
end
