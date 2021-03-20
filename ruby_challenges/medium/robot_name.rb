class Robot

  @@used_names = []

  def name
    return @name if @name
    @name = generate_random_name while @@used_names.include?(@name) || @name.nil?
    @@used_names << @name
    @name
  end

  def reset
    @@used_names.delete(@name)
    @name = nil
  end

  def generate_random_name
    name = ''
    2.times { name << rand(65..90).chr }
    3.times { name << rand(0..9).to_s }
    name
  end
end
