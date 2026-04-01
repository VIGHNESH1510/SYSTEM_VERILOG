module array_ordering;
  typedef struct
  {
    int id;
    int data;
  } vars;
  vars c[] = '{'{5,10},'{1,8},'{1,3},'{2,9}};
  int a[] = '{11,2,33,4,55,88};
  int q[];
  initial begin
    $display("Array a = %p",a);
    a.reverse(); // void method
    $display("reverse() a = %p",a);
    
    a.sort(x) with (x>11);
    $display("sort() a= %p",a); //with clause returns true(1) or false(0) ,ordering is based on that key
    a.sort();
    $display("sort() a = %p",a);
    c.sort(x) with (x.id);
    $display("sort() c =%p",c); 
    
    c.rsort(x) with (x.data);
    $display("rsort() c = %p",c);
    
    a.shuffle();
    $display("1st shuffle a = %p",a);
     a.shuffle();
    $display("2nd shuffle a = %p",a);
  end
endmodule

/*
OUTPUT
Array a = '{11, 2, 33, 4, 55, 88}
reverse() a = '{88, 55, 4, 33, 2, 11}
sort() a= '{4, 2, 11, 88, 55, 33}
sort() a = '{2, 4, 11, 33, 55, 88}
sort() c ='{'{id:1, data:8}, '{id:1, data:3}, '{id:2, data:9}, '{id:5, data:10}}
rsort() c = '{'{id:5, data:10}, '{id:2, data:9}, '{id:1, data:8}, '{id:1, data:3}}
1st shuffle a = '{11, 2, 55, 88, 4, 33}
2nd shuffle a = '{55, 88, 11, 4, 33, 2} */
