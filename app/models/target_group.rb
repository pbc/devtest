class TargetGroup < ActiveRecord::Base
  belongs_to :country
  belongs_to :panel_provider
  belongs_to :parent_target_group, class_name: "TargetGroup", foreign_key: :parent_id
  has_many :child_target_groups, class_name: "TargetGroup", foreign_key: :parent_id
end
