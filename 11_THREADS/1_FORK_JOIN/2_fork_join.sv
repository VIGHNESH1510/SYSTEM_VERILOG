module fork_join;
  
  initial
    begin
      $display("time = %0t ,Fork block begins",$time);
      
      fork 
        begin
          #2 $display("time = %0t ,task_1 begins",$time); // statements inside this block execute sequentially
          #10 $display("time = %0t ,task_1 ends",$time);
        end
        
        begin
          #3 $display("time = %0t ,task_2 begins",$time);
          #5 $display("time = %0t ,task_2 ends",$time);
        end
        
        #7 $display("time = %0t , task_3 done",$time);
      join
      #1 $display("time = %0t , fork block ends",$time);
      #2 $display("time = %0t , Join block begins",$time);
    end
endmodule

/*
OUTPUT
time = 0 ,Fork block begins
time = 2 ,task_1 begins
time = 3 ,task_2 begins
time = 7 , task_3 done
time = 8 ,task_2 ends
time = 12 ,task_1 ends
time = 13 , fork block ends
time = 15 , Join block begins
*/
