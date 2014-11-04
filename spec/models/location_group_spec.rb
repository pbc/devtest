require 'rails_helper'

RSpec.describe LocationGroup, :type => :model do
  context "relationships" do
    it {should belong_to :country}
    it {should belong_to :panel_provider}
  end
end
