class AddIndexToCountries < ActiveRecord::Migration
  def up
    add_index :countries, :country_code
  end

  def down
    remove_index :countries, :country_code
  end
end
