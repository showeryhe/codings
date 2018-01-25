¬¬x=x

x*0=0
x+1=1

x*1=x
x+0=x

x*x=x
x+x=x

x*¬x=0
x+¬x=1

abelian: 
x*y=y*x; 
x+y=y+x

associative:
x*(y*z)=(x*y)*z; 
x+(y+z)=(x+y)+z

> x*(y+z)=x*y+x*z
 | x | y | z | x*(y+z) | x*y + x*z | 
 | - | - | - | ------- | --------- |
 | 0 | 0 | 0 |    0    |     0     |
 | 0 | 0 | 1 |    0    |     0     |
 | 0 | 1 | 0 |    0    |     0     |
 | 0 | 1 | 1 |    0    |     0     |
 | 1 | 0 | 0 |    0    |     0     |
 | 1 | 0 | 1 |    1    |     1     |
 | 1 | 1 | 0 |    1    |     1     |
 | 1 | 1 | 1 |    1    |     1     |
x*(y+z)==1
iff (x == 1 && y+z ==1)
iff (x == 1 && (y == 1 || z == 1))
iff ((x == 1 && y == 1) || (x == 1 && z == 1))
iff (x*y + x*z)

> x+y*z=(x+y)*(x+z)
(x+y)*(x+z) = x*x + x*z + y*x + y*z = x*(1+y+z) + y*z = x*1 + y*z = x + y*z

x+x*y=x
x*(x+y)=x

x*y+x*¬y=x
(x+y)*(x+¬y)=x

¬(x*y)=¬x+¬y
¬(x+y)=¬x*¬y

x+¬x*y=x+y
x*(¬x+y)=x*y

x*y+¬x*z+y*z=x*y+¬x*z
(x+y)*(¬x+z)*(y+z)=(x+y)*(¬x+z)
