tmphash = Hash.new
def pullhash
    File.open('storage.txt', 'r').each do |line|
        line.push

