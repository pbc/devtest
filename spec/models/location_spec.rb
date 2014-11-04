require 'rails_helper'

RSpec.describe Location, :type => :model do
  context "relationships" do
    it {should belong_to :country}
  end
end
