require 'json'

def to_json(hash)
    JSON.generate hash
end

def from_json(hash)
    JSON.parse hash
end

def save_file(path, data)
    File.open(path, 'w') do |f|
        f.puts to_json(data)
    end
end

def read_file(path)
    array = []
    File.open(path, 'r') do |f|
        f.each_line do |line|
            hash = from_json(line)
            array.push(hash)
        end
        f.close
    end
    array
end