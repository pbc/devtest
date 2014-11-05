class TargetGroupFactory
  def initialize(country, provider)
    @country = country
    @provider = provider
  end
  
  def create_target_group_with(group_name, child_groups={}, parent_group=nil)
    parent_target_group = create_target_group(group_name, parent_group)
    child_groups.each do |name, child_groups|
      create_target_group_with(name, child_groups, parent_target_group)
    end
  end

  private
  def create_target_group(group_name, parent)
    TargetGroup.create(
      name: group_name, 
      external_id: RandomGenerator.generate_random_id,
      secret_code: RandomGenerator.generate_secret_code,
      country: @country,
      panel_provider: @provider,
      parent_target_group: parent
    )
  end
end