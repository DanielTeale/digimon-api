#################################################################### ‎(ﾉಥ益ಥ）ﾉ ┻━┻
#   Requirements =================================================##
#   - Your application must have a class named Element with      |##
#       the following attributes:                                |##
#           - name                                               |## (╯'□')╯︵ ┻━┻
#           - atomic mass                                      |##
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
#     their name, atomic mass and atomic number and            |##
#     instantiate them as instances of your Element class        |##
#                                                                |##
#   - Implement a way to round the atomic mass of the element  |##
#     to the nearest whole number                                |## ʕノ•ᴥ•ʔノ ︵ ┻━┻
#                                                                |##
#   - Implement a way to display your three elements and all     |##
#     their attributes, including their atomic mass rounded    |##
#     to the nearest whole number                                |## ┬─┬ ︵ /(.□. \）
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ##
####################################################################
#################################################################### (ノ^_^)ノ┻━┻ ┬─┬ ノ( ^_^ノ)

### YOUR CODE HERE:
require 'json'
require_relative 'element'

# uranium = Element.new
# uranium.name = "Uranium"
# uranium.atomic_mass = 238.02891
# uranium.number = 92 

# iron = Element.new
# iron.name = "Iron"
# iron.number = 26
# iron.atomic_mass = 55.845

# krypton = Element.new
# krypton.name = 'Krypton'
# krypton.number = 36
# krypton.atomic_mass = 83.798

# # iron.element_info
# # uranium.element_info
# # krypton.element_info

# Element.element_info_all

file = 'PeriodicTableJSON.txt'
hash = JSON.parse(File.read(file))
hash = hash["elements"]
hash.each do |x|
  instance_variable_set("@#{x['name'].downcase}", Element.new(x))
end


puts @hydrogen.name