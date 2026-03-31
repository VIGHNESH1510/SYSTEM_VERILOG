module operators;
  logic[3:0] a,b;
  reg signed [3:0]c;
  initial begin
    a='b1101;
    b='b0101;
    $display("value of a = %b(%0d) value of b = %b(%0d)",a,a,b,b);
    
    $display("Arithmetic operators");
    $display("a+b = %0d | a-b = %0d | a*b= %0d | a/b = %0d | a mod b = %0d",a+b,a-b,a*b,a/b,a%b);
    
    $display("Logical operators");
    $display("a||b = %b | a&&b = %b | !a = %b",a||b ,a&&b, !a);
    
    $display("Bitwise operators");
    $display("a&b = %4b | a|b = %b | a^b = %b | a~^b = %b | ~b = %b",a&b,a|b,a^b,a~^b,~b);
    
    $display("Relational operators");
    $display("a>b = %0d a<b = %0d a>=b =%0d",a>b,a<b,a>=b);
    
    $display("Shift operators");
    c= 'b1110;
    $display("value of C = %b(%0d)",c,c);
    $display("c>>1 = %b | c<<1 = %b | c<<<1 =%b | c>>>1 =%b",c>>1,c<<1,c<<<1,c>>>1);
    
    $display("Equality operator");
    c= 'b1xx1;
    $display("a!=b = %b | a==c = %b | 'b1xx1===c = %b",a==b,a!=c,'b1xx1===c);
    
    $display("Reduction Operator");
    $display("~a = %b | ^a = %b | &a = %b | |a = %b",~a,^a,&a,|a);
    
    $display("Conditional operator");
    $display((a>b) ? "A is greater" : "B is greater");
    
    $display("concatenation & Replication operator");
    $display("{a,b} = %b | {3{a}} = %b",{a,b},{3{a}});
  end
endmodule
/*
OUTPUT
value of a = 1101(13) value of b = 0101(5)
Arithmetic operators
a+b = 2 | a-b = 8 | a*b= 1 | a/b = 2 | a mod b = 3
Logical operators
a||b = 1 | a&&b = 1 | !a = 0
Bitwise operators
a&b = 0101 | a|b = 1101 | a^b = 1000 | a~^b = 0111 | ~b = 1010
Relational operators
a>b = 1 a<b = 0 a>=b =1
Shift operators
value of C = 1110(-2)
c>>1 = 0111 | c<<1 = 1100 | c<<<1 =1100 | c>>>1 =1111
Equality operator
a!=b = 0 | a==c = x | 'b1xx1===c = 1
Reduction Operator
~a = 0010 | ^a = 1 | &a = 0 | |a = 1
Conditional operator
A is greater
concatenation & Replication operator
{a,b} = 11010101 | {3{a}} = 110111011101 */
