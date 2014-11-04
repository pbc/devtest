require 'rails_helper'

RSpec.describe PanelProvider, :type => :model do
  context "relationships" do
    it {should have_many :countries}
  end
end
