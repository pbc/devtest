require 'rails_helper'

RSpec.describe Country, :type => :model do
  context "relationships" do
    it {should belong_to :panel_provider}
    it {should have_many :locations}
    it {should have_many :location_groups}
    it {should have_and_belong_to_many :target_groups}

    context "target groups association" do
      let(:country){FactoryGirl.build(:country)}
      let(:parent_target_group){FactoryGirl.build(:target_group)}
      let(:child_target_group){FactoryGirl.build(:target_group, parent_target_group: parent_target_group)}
      
      it "should only accept root nodes for this association" do
        expect{country.target_groups << child_target_group}.to raise_error RuntimeError
      end
    end
  end
end
