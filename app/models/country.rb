class Country < ActiveRecord::Base
  belongs_to :panel_provider
  has_many :locations
  has_many :location_groups, through: :locations
  has_and_belongs_to_many :target_groups, before_add: :check_target_group_is_root

  def panel_provider_unique_locations
    panel_provider.locations.uniq if panel_provider
  end

  def calculate_price_with_default_panel_provider
    panel_provider.calculate_price if panel_provider
  end

  private
  def check_target_group_is_root(target_group)
    unless target_group.is_root_node?
      raise "Impossible to add this target group. Only root nodes are allowed!"
    end
  end
end
