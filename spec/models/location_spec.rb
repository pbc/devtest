require 'rails_helper'

RSpec.describe Location, :type => :model do
  context "relationships" do
    it {should belong_to :country}
    it {should have_and_belong_to_many :location_groups}
  end
end
