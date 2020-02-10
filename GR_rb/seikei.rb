
10.times do |i|
  data = []
  File.foreach("hv/fitness_0") do |line|
    input = line.split(" ").map(&:to_f)
    data << [input[0],input[1],input[2]]
  end

  File.open("hv/fitness_0","w") do |f|
    data.each do |line|
      f.puts line.join(" ")
    end
  end
end
