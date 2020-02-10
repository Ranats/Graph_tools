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

opts = {xlabel: "generation",
        ylabel: "hyperVolme",
        backgroundcolor: 0,
        size: [1920,1080]}

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

x = Array.new(101){0}
y = [*0..100]
z = []
c = []
flg = false

p x

10.times do |i|
  File.foreach("hv/#{i}").with_index do |line,d|
    x[d] += line.to_f
  end
#  GR.plot(y,x)
#  GR.updatews
#  sleep(2)
end

x.map!{|i| i /= 10}
GR.plot(y,x,opts)

#sma = []
#x.each_cons(3) do |a,b,c|
#  sma << (a+b+c)/3
#end
#GR.plot([*0...sma.size],sma,opts)

#GR.polarcellarray(0,0,0,360,0,1,10,100,c)
#GR.setviewport(0.9, 0.925, 0.1, 0.7)
#GR.colorbar()
#GR.updatews

#GR.scatter(x,y,opts)
gets
GR.savefig("hv_p.png")