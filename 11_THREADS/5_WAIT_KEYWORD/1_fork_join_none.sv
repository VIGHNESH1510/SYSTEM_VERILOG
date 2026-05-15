module fork_join_none;
  
  initial
    begin
      $display("time = %0t ,Fork block begins",$time);
      
      fork 
        #1 $display("time =%0t , task begins",$time);
        begin
          #2 $display("time = %0t ,task_1 begins",$time);
          #10 $display("time = %0t ,task_1 ends",$time);
        end
        
        begin
          #3 $display("time = %0t ,task_2 begins",$time);
          #1 $display("time = %0t ,task_2 ends",$time);
        end
        begin
          #7 $display("time = %0t , task_3 begins",$time);
          #3 $display("time = %0t , task_3 ends",$time);
        end
      join_none
      #1 $display("time = %0t , out of fork block",$time);
      wait fork;
        #2 $display("time = %0t , After fork_join_none",$time);
    end
endmodule

/*
OUTPUT
time = 0 ,Fork block begins
time = 1 , out of fork block
time =1 , task begins
time = 2 ,task_1 begins
time = 3 ,task_2 begins
time = 4 ,task_2 ends
time = 7 , task_3 begins
time = 10 , task_3 ends
time = 12 ,task_1 ends
time = 14 , After fork_join_none
*/
