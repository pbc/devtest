require 'rails_helper'

RSpec.describe Country, :type => :model do
  context "relationships" do
    it {should belong_to :panel_provider}
    it {should have_and_belong_to_many :location_groups}
  end
end
