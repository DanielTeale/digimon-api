

class Element
  # attr_accessor :name, :appearance, :boil, :category, :color, :density, :discovered_by, :melt, :molar_heat, :named_by, :atomic_mass, :number, :period, :phase, :source, :spectral_img, :summary, :symbol, :xpos, :ypos, :shells
  def initialize hash
    hash.each do |key,value|
      instance_variable_set("@#{key}", value)
      if self.class.count == 0
        self.class.define_method key do
          instance_variable_get("@#{key}")
        end
      end
    end
    # @name = nil
    # @appearance = nil
    # @atomic_mass = nil
    # @boil = nil
    # @category = nil
    # @color = nil
    # @density = nil
    # @discovered_by = nil
    # @melt = nil
    # @molar_heat = nil
    # @named_by = nil
    # @number = nil
    # @period = nil
    # @phase = nil
    # @source = nil
    # @spectral_img = nil
    # @summary = nil
    # @symbol = nil
    # @xpos = nil
    # @shells = nil
    self.class.all << self
  end

  @element = []

  class << self
  # Count all instances
    def count
      @element.count
    end
  # Append to @element array  
    def all
      @element
    end
  # Display info for all element instances  
    def element_info_all
      @element.each do |x|
        puts "#{x.name} is an element with the atomic number #{x.number} and atomic mass of #{x.atomic_mass}"
      end
    end
  end
  # Set atomic_mass with rounding
  def atomic_mass=(mass)
    @atomic_mass = mass.round(0)
  end
  # Display instance info
  def element_info
    puts "#{@name} is an element with the atomic number #{@number} and atomic mass of #{@atomic_mass}"
  end
end


