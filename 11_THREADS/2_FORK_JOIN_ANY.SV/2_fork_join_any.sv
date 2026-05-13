module fork_join_any;
  
  initial
    begin
      $display("time = %0t ,Fork block begins",$time);
      
      fork 
        begin
          #2 $display("time = %0t ,task_1 begins",$time);
          #10 $display("time = %0t ,task_1 ends",$time);
        end
        
        begin
          #3 $display("time = %0t ,task_2 begins",$time);
          #1 $display("time = %0t ,task_2 ends",$time);
        end
        
        #7 $display("time = %0t , task_3 done",$time);
      join_any
      #1 $display("time = %0t , out of fork block",$time);
      #2 $display("time = %0t , Join block begins",$time);
    end
endmodule

/*
OUTPUT
time = 0 ,Fork block begins
time = 2 ,task_1 begins
time = 3 ,task_2 begins
time = 4 ,task_2 ends
time = 5 , out of fork block
time = 7 , task_3 done
time = 7 , Join block begins
time = 12 ,task_1 ends
*/
