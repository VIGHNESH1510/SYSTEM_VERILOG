module array_reduction;
  int a[] ={1,2,3,4,5,8};
  initial begin
    $display("Array a = %p",a);
    $display("sum() a = %0d",a.sum());
    $display("sum() with a = %0d",a.sum(x) with (x>2 ? x: 0));
    $display("and() a = %0d",a.and()); //bitwise and() of all elements
    $display("product() a = %0d",a.product());
    $display("product with = %0d", a.product(x) with (x > 2 ? x : 1));
    $display("xor() a = %0d",a.xor()); //bitwise xor() of all elements
  end
endmodule

/*
OUTPUT
Array a = '{1, 2, 3, 4, 5, 8}
sum() a = 23
sum() with a = 20
and() a = 0
product() a = 960
product with = 480
xor() a = 9 */
