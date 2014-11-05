class RandomGenerator
  def self.generate_random_id
    "#{DateTime.now.nsec + rand(1111111..9999999)}"
  end

  def self.generate_secret_code
    Digest::SHA1.hexdigest(generate_random_id)
  end
end