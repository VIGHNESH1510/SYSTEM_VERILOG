
module assoc_array;
  int arr1[*];
  string arr2[string];
  string idx;
  int ind;
  initial
    begin
      arr1 = '{1:11,2:22,8:88,5:55};
      arr2["one"] = "A";
      arr2["two"] = "B";
      arr2["five"] = "C";
      $display("arr1 = %p",arr1);
      $display("arr2 = %p",arr2);
      
      foreach(arr2[i])
        begin
          $display("arr2[%s] =%s",i,arr2[i]);
        end
      //.size() and .num() returns the no of elements 
      $display("size of arr1 =%0d & arr2 =%0d",arr1.size(),arr2.num());
      
      if (arr2.first(idx))  //arr.first(idx) returns 1 if first element exists and sets the index to first element
        begin
  			$display("First key = %s, Value = %s", idx, arr2[idx]);
		end
      
      if (arr2.last(idx))  //arr.last(idx) returns 1 if last element exists and sets the index to last element
        begin
          $display("last key = %s, Value = %s", idx, arr2[idx]);
		end
      
      //arr.next(ind) returns 1 if next index exist or 0
      $display("current_key = %0d , next_key_exist = %0d next_key_value = %0d",ind,arr1.next(ind),arr1[ind]);
      $display("current_key = %0d , next_key_exist = %0d next_key_value = %0d",ind,arr1.next(ind),arr1[ind]);
      
      //arr.prev(ind) returns 1 if prev index exist or 0
      $display("current_key = %0d , prev_key_exist = %0d prev_key_value = %0d",ind,arr1.prev(ind),arr1[ind]);
      $display("current_key = %0d , prev_key_exist = %0d prev_key_value = %0d",ind,arr1.prev(ind),arr1[ind]);
      
      
      //arr.exist(ind) returns 1 if element exists at specific index
      $display("current_key = %0d element_exist = %0d ",ind,arr1.exists(ind));
      
      //arr.delete(ind) deletes specific element in array 
      //arr.delete() deletes the entire array
      arr1.delete(ind);
      $display("arr1 = %p",arr1);
      arr2.delete();
      $display("arr2 = %p",arr2);
      
    end
endmodule

/*
OUTPUT 
arr1 = '{'h1:11, 'h2:22, 'h5:55, 'h8:88}
arr2 = '{"five":"C", "one":"A", "two":"B"}
arr2[five] =C
arr2[one] =A
arr2[two] =B
size of arr1 =4 & arr2 =3
First key = five, Value = C
last key = two, Value = B
current_key = 0 , next_key_exist = 1 next_key_value = 11
current_key = 1 , next_key_exist = 1 next_key_value = 22
current_key = 2 , prev_key_exist = 1 prev_key_value = 11
current_key = 1 , prev_key_exist = 0 prev_key_value = 11
current_key = 1 element_exist = 1 
arr1 = '{'h2:22, 'h5:55, 'h8:88}
arr2 = '{} */
