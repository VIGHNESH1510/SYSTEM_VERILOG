module struct_array;
  typedef struct{
    string name;
    int id;
  }tstruct;
  
  tstruct arr[5];
  tstruct dyn[];
  tstruct asso[int];
  tstruct queue[$];
  initial
    begin
      foreach(arr[i])begin
        arr[i].name = $sformatf("arr%0d", i);
        arr[i].id = i+2;
      end
      $display("fixed array = %p",arr);
      
      dyn = arr;
      $display("dynamic array = %p",dyn);
      
      asso[0] = '{name:"arm",id:12};
      asso[5] = '{name:"orm",id:11};
      $display("Associative array = %p",asso);
      
      queue.insert(0,'{name:"arm",id:12});
      $display("Queue = %p",queue);
    end
endmodule

/*
OUTPUT
fixed array = '{'{name:"arr0", id:2}, '{name:"arr1", id:3}, '{name:"arr2", id:4}, '{name:"arr3", id:5}, '{name:"arr4", id:6}}
dynamic array = '{'{name:"arr0", id:2}, '{name:"arr1", id:3}, '{name:"arr2", id:4}, '{name:"arr3", id:5}, '{name:"arr4", id:6}} 
Associative array = '{0x0:'{name:"arm", id:12}, 0x5:'{name:"orm", id:11}} 
Queue = '{'{name:"arm", id:12}}  */
