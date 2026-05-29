
class transaction;
  rand bit  code;
  rand bit [3:0] data;
  
  constraint cons1{
    code ==1 -> data==2;
    solve code before data;
                 }
  
  constraint cons2{
    code ==1 -> data==2;
//     solve code before data;
                 }
  
endclass


module tb;
  
  transaction tr;
  
  initial 
    begin
      tr = new();
      //assert(tr.randomize());
      tr.cons2.constraint_mode(0);
      $display("with solve..before");
      for(int i=1; i<=10; i++)
        begin
          
          assert(tr.randomize());
          $display("Iteration =%0d code =%0d data =%0d",i,tr.code,tr.data);
        end
      
      $display();
      tr.cons1.constraint_mode(0);
      $display("without solve..before");
      for(int i=1; i<=10; i++)
        begin
          
          assert(tr.randomize());
          $display("Iteration =%0d code =%0d data =%0d",i,tr.code,tr.data);
        end
      
    end
endmodule

/*
xcelium> run
with solve..before
Iteration =1 code =0 data =8
Iteration =2 code =0 data =3
Iteration =3 code =1 data =2
Iteration =4 code =1 data =2
Iteration =5 code =0 data =4
Iteration =6 code =1 data =2
Iteration =7 code =0 data =14
Iteration =8 code =0 data =11
Iteration =9 code =0 data =4
Iteration =10 code =0 data =1
 
without solve..before
Iteration =1 code =1 data =11
Iteration =2 code =1 data =4
Iteration =3 code =1 data =0
Iteration =4 code =0 data =14
Iteration =5 code =1 data =1
Iteration =6 code =1 data =1
Iteration =7 code =0 data =2
Iteration =8 code =0 data =3
Iteration =9 code =0 data =11
Iteration =10 code =1 data =4

*/
