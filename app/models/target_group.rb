class TargetGroup < ActiveRecord::Base
  belongs_to :parent, :class_name => "TargetGroup"

  has_many :children, :class_name => "TargetGroup", :foreign_key => "parent_id"

  has_and_belongs_to_many :countries
end
