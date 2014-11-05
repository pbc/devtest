class TargetGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider
  belongs_to :parent_target_group, class_name: "TargetGroup", foreign_key: :parent_id
  has_many :child_target_groups, class_name: "TargetGroup", foreign_key: :parent_id
  has_and_belongs_to_many :countries

  def self.root_nodes
    where("parent_id IS NULL")
  end

  def self.by_country_and_main_provider(country)
    main_panel_provider = country.panel_provider
    raise ArgumentError, "Country doesnt have a main provider!" if main_panel_provider.nil?
    where("country_id = ? AND panel_provider_id = ?", country.id, main_panel_provider.id)    
  end

  def is_root_node?
    self.parent_target_group.blank?
  end
end
