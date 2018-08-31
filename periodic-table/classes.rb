#################################################################### ‎(ﾉಥ益ಥ）ﾉ ┻━┻
#   Requirements =================================================##
#   - Your application must have a class named Element with      |##
#       the following attributes:                                |##
#           - name                                               |## (╯'□')╯︵ ┻━┻
#           - atomic weight                                      |##
#           - atomic number                                      |##
#     Put your Element class in a separate file to               |##
#     periodic_table.rb (require_relative)                       |##
#                                                                |##
#     - Create class instance methods and a class                |##
#       instance variable:                                       |##
#           - return all instances of the Element class          |##
#           - return a count of Element instances                |##
#                                                                |##
#   - Find THREE elements on the periodic table and record       |## (ﾉಥДಥ)ﾉ︵┻━┻･/
#     their name, atomic weight and atomic number and            |##
#     instantiate them as instances of your Element class        |##
#                                                                |##
#   - Implement a way to round the atomic weight of the element  |##
#     to the nearest whole number                                |## ʕノ•ᴥ•ʔノ ︵ ┻━┻
#                                                                |##
#   - Implement a way to display your three elements and all     |##
#     their attributes, including their atomic weight rounded    |##
#     to the nearest whole number                                |## ┬─┬ ︵ /(.□. \）
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ##
####################################################################
#################################################################### (ノ^_^)ノ┻━┻ ┬─┬ ノ( ^_^ノ)

### YOUR CODE HERE:

class Element
  attr_accessor :name, :atomic_weight, :atomic_number
  def initialize
    @name = nil
    @atomic_weight = nil
    @atomic_number = nil
    self.class.all << self
  end

  @element = []

  class << self
    def count
      @element.count
    end

    def all
      @student
    end
  end

  def atomic_weight=(weight)
    @atomic_weight = weight.round(0)
  end

end

  uranium = Element.new
  uranium.name = "Uranium"
  uranium.atomic_weight = 238.02891
  uranium.atomic_number = 92 

  p uranium.name
  p uranium.atomic_weight
  p uranium.atomic_number

