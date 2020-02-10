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
        line_width: 4,}

#GR.setlinetype(style: "1")
#GR.setmarkersize(5)
#GR.setlinewidth(10.0)
#p GR.inqlinewidth()
#

GR.scatter(x,y,opts)
gets
GR.savefig("out.png")