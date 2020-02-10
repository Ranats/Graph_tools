require 'gr/plot'
require 'numo/narray'
DFloat = Numo::DFloat


def f_1 x
  x ** 2
end

def f_2 x
  (x-2)**2
end

x = []
y = []
-1.0.step(3.0,0.1) do |i|
  x << f_1(i)
  y << f_2(i)
end

opts = {ylabel: "f_2",
        xlabel: "f_1",
        zlabel: "f_3",
        rotation: 30, tilt:45,
        colormap: 1,
        clim: [0,100],
        crange:[0,100]}

#GR.setlinetype(style: "1")
#GR.setmarkersize(5)
#GR.setlinewidth(10.0)
#p GR.inqlinewidth()
#

#
# 非劣解は必ず100個体存在する？
# いや，ランク0の個体のみに絞った方が良い
# → 1世代の個体数は増減する．
# -1とかの値で判定する？

#CSV.foreach("fitness.csv") do |csv|

#end

# 格納：[gen]+[f1,f2,f3].join(",") みたいな感じで
#File.open("fitness.dat") do |f|
  # [gen, f1, f2, f3]
#  line = f.gets.chomp.split(",")
#end

x = []
y = []
z = []
c = []
flg = false

File.foreach("fitness_g0") do |line|
  g,f1,f2,f3,d = line.split(",").map(&:to_f)
  if g % 2 == 0
    flg = true
  x << f1
  y << f2
  z << f3
  c << g
  end
  if g % 2 == 1 and flg
    p c
    GR.clearws
    GR.scatter3(x,y,z,c,opts)
    GR.updatews
#    sleep(0.1)
    flg = false
  end
end

#x = (0..100).map{|i| (0...100).map{rand(i/2.0..i)}}.flatten
#y = (0..100).map{|i| (0...100).map{rand(i/2.0..i)}}.flatten
#z = (0..100).map{|i| (0...100).map{rand(i/2.0..i)}}.flatten
#c = (0..100).map {|i| (0...100).map{i*0.1}}.flatten

p x
p c

GR.scatter3(x,y,z,c,opts)
#GR.polarcellarray(0,0,0,360,0,1,10,100,c)
#GR.setviewport(0.9, 0.925, 0.1, 0.7)
#GR.colorbar()
#GR.updatews

#GR.scatter(x,y,opts)
gets
GR.savefig("out.png")