class transaction; //weighted constraint
  
  rand logic [3:0] data1;
  rand logic [3:0] data2;
  rand logic [3:0] data3;
  
  constraint cons1{data1 dist {1:=3, 5:=2, [10:15]:=5};}
  constraint cons2{data2 dist {1:/3, 5:/2, [10:15]:/5};}
  constraint cons3{data3 inside {[5:15]}; 
                   data3 dist {[5:10]:=10 , [11:15]:/30};}
endclass


module tb;
  
  task   display(transaction tr, bit[1:0] sel);
    logic [3:0] value;
     //value = (sel==1) ? tr.data1: ((sel==2) ? tr.data2: ((sel==3)? tr.data3: 4'd0));
    for(int i=1; i<=10; i+=1)
      begin
        assert(tr.randomize());
        value = (sel==1) ? tr.data1: ((sel==2) ? tr.data2: ((sel==3)? tr.data3: 4'd0));
        $write ("Iteration=%0d data=%0d  ", i,value);
        assert(tr.randomize());
        value = (sel==1) ? tr.data1: ((sel==2) ? tr.data2: ((sel==3)? tr.data3: 4'd0));
        $write("Iteration=%0d data=%0d  \n", (10+i),value);
      end
  endtask
  
  
  transaction tr;
  initial begin
    tr = new();
    $display("Randomizing the data");
    $display(":= operator");
    display(tr,1);
    
    $display("\n:/ operator");
    display(tr,2);
    
    $display("\n := and :/ operator");
    display(tr,3);
   
  end
    
endmodule

/*
Randomizing the data
:= operator
Iteration=1 data=10  Iteration=11 data=13  
Iteration=2 data=1  Iteration=12 data=15  
Iteration=3 data=14  Iteration=13 data=13  
Iteration=4 data=11  Iteration=14 data=13  
Iteration=5 data=14  Iteration=15 data=11  
Iteration=6 data=13  Iteration=16 data=14  
Iteration=7 data=10  Iteration=17 data=11  
Iteration=8 data=11  Iteration=18 data=11  
Iteration=9 data=12  Iteration=19 data=13  
Iteration=10 data=5  Iteration=20 data=14  

:/ operator
Iteration=1 data=1  Iteration=11 data=5  
Iteration=2 data=14  Iteration=12 data=15  
Iteration=3 data=11  Iteration=13 data=5  
Iteration=4 data=1  Iteration=14 data=13  
Iteration=5 data=12  Iteration=15 data=11  
Iteration=6 data=1  Iteration=16 data=5  
Iteration=7 data=1  Iteration=17 data=1  
Iteration=8 data=1  Iteration=18 data=13  
Iteration=9 data=1  Iteration=19 data=14  
Iteration=10 data=1  Iteration=20 data=12  

 := and :/ operator
Iteration=1 data=7  Iteration=11 data=11  
Iteration=2 data=9  Iteration=12 data=5  
Iteration=3 data=10  Iteration=13 data=8  
Iteration=4 data=7  Iteration=14 data=7  
Iteration=5 data=9  Iteration=15 data=15  
Iteration=6 data=14  Iteration=16 data=6  
Iteration=7 data=10  Iteration=17 data=10  
Iteration=8 data=5  Iteration=18 data=14  
Iteration=9 data=9  Iteration=19 data=13  
Iteration=10 data=9  Iteration=20 data=14  
*/
