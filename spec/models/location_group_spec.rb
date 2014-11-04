require 'rails_helper'

RSpec.describe LocationGroup, :type => :model do
  context "relationships" do
    it {should belong_to :country}
    it {should belong_to :panel_provider}
    it {should have_and_belong_to_many :locations}
    it {should have_and_belong_to_many :countries}
  end
end
