require 'rails_helper'

RSpec.describe Country, :type => :model do
  it {should belong_to :panel_provider}
end
