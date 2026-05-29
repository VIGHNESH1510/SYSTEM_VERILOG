class transaction; // inline constraints doesnt override, it just overlap with the class constriant
  
  rand byte data;
  rand bit [7:0]addr;
  rand bit WR;
  
  constraint cons{data inside {[1:8]}; 
                  addr %4==0; }
endclass

module tb;
  
  transaction tr;
  
  initial 
    begin
      
      tr= new();
      
      for(int i=1; i<11; i++)
        begin
          assert(
            tr.randomize() with {
            data inside {[1:5]}; 
            WR==1;}  );
          
          $display("Iteration =%0d  WR=%0b  Data =%0d  Add = %0d",i,tr.WR,tr.data,tr.addr);
        end
      
      
      assert(
            tr.randomize() with {
              data inside {[10:15]};   // randomization fails , as the constraints conflicts
            WR==1;}  );
      $display(" WR=%0b  Data =%0d  Add = %0d",tr.WR,tr.data,tr.addr); //may print old or stale randomized values
    end
  
endmodule

/*
Iteration =1  WR=1  Data =5  Add = 28
Iteration =2  WR=1  Data =1  Add = 76
Iteration =3  WR=1  Data =5  Add = 180
Iteration =4  WR=1  Data =2  Add = 52
Iteration =5  WR=1  Data =5  Add = 108
Iteration =6  WR=1  Data =1  Add = 120
Iteration =7  WR=1  Data =3  Add = 232
Iteration =8  WR=1  Data =5  Add = 172
Iteration =9  WR=1  Data =5  Add = 112
Iteration =10  WR=1  Data =2  Add = 228
*/
