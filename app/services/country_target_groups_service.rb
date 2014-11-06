#encoding: utf-8
class CountryTargetGroupsService
  def initialize(country_code)
    @country_code = country_code
  end

  def get_target_groups_through_provider
    country = Country.find_by_country_code(@country_code)
    if country
      root_nodes = TargetGroup.by_country_and_main_provider(country).root_nodes
      target_group_dtos = []
      
      root_nodes.each do |target_group|
        hash = create_hash_of_attributes_for(target_group)
        target_group_dtos << hash
      end

      target_group_dtos
    end
  end

  private
  def create_hash_of_attributes_for(target_group)
    attributes_hash = target_group.attributes
    target_group.child_target_groups.each do |target_group|
      attributes_hash[:child_target_groups] ||= []
      attributes_hash[:child_target_groups] << create_hash_of_attributes_for(target_group)
    end
    attributes_hash
  end
end