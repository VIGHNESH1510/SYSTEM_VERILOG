module array_locator;
  int a[] ='{11,2,33,444,1,3,5,2};
  int q[];
  initial begin
    $display("Array a = %p",a);
    //must use with clause for below methods
    $display("Array locator Methods");
    q = a.find(x) with (x>3);
    $display("find() %p",q);
    q = a.find_index(x) with (x>3);
    $display("find_index() %p",q);
    q = a.find_first(x) with (x>11);
    $display("find_first() %p",q); 
    q = a.find_last_index(x) with (x>11);
    $display("find_last_index() %p",q);
    q = a.find_last(x) with (x>11);
    $display("find_last() %p",q);
    q = a.find_first_index(x) with (x>11);
    $display("find_first_index() %p",q);
    
    //optional with clause methods
    q = a.min();
    $display("min() %p",q);
    q= a.min(x) with (x>5);
    $display("min() %p",q);
    q= a.max();
    $display("max() %p",q);
    q= a.max(x) with (x>1 && x<11);
    $display("max() %p",q);
    q = a.unique();
    $display("unique() %p",q);
    q= a.unique_index();
    $display("unique_index() %p",q);
  end
endmodule

/*
Array a = '{11, 2, 33, 444, 1, 3, 5, 2}
Array locator Methods
find() '{11, 33, 444, 5}
find_index() '{0, 2, 3, 6}
find_first() '{33}
find_last_index() '{3}
find_last() '{444}
find_first_index() '{2}
min() '{1}
min() '{2}
max() '{444}
max() '{2}
unique() '{11, 2, 33, 444, 1, 3, 5}
unique_index() '{0, 1, 2, 3, 4, 5, 6} */
