# Chapter 3
to execute the example 3.1, we have to input

` $ gcc os_eg_3_1.c **-lm**`

[cite](http://docs.linuxtone.org/ebooks/C&CPP/c/ch03s01.html)
> 使用math.h中的函数还有一点特殊之处，
gcc命令行必须加-lm选项, 因为数学函数位于libm.so库文件中 (通常在/lib目录下), -lm选项告诉编译器，
我们程序中用到的数学函数要到这个库文件里找.

? how to set the color of markdown file.

`$ echo $?`

[cite](http://docs.linuxtone.org/ebooks/C&CPP/c/ch03s02.html)

$?是Shell中的一个特殊变量，表示上一个运行结束的程序的退出状态.

先声明后使用

# Chapter 4
## Section 1

[cite](docs.linuxtone.org/ebooks/C&CPP/c/ch04s01.html)
> 在数学中a<b<c表示b既大于a又小于c, 但作为C语言表达式却不是这样.
> 以上几种运算符都是左结合的, 请读者想一下这个表达式表示什么?

>`#include <stdio.h>`

`int main(void)`

`{`

`  int a = 1, b = 2, c = 1;`

`  if (a<b==c){`
`      printf("%d<%d==%d is is true.\n", a, b, c);`
<code>
  }
  return 0;
}</code>

## section 2
[cite](http://docs.linuxtone.org/ebooks/C&CPP/c/ch04s02.html)

> C语言规定, `else`总是和它上面最近的一个`if`配对.

## section 4
[cite](http://docs.linuxtone.org/ebooks/C&CPP/c/ch04s04.html)
> 进入case后如果没有遇到break语句就会一直往下执行，后面其它case或default下面的语句也会被执行到，直到遇到break，或者执行到整个switch语句块的末尾。
