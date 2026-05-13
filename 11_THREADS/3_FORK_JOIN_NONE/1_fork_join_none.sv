module fork_join_none; // does not wait for child threads to finish
  
  initial begin
    
    $display("time =%0t ,fork Block Begins",$stime);
    fork  // parallel execution
      $display("time =%0t , Thread_1 completed ",$stime);
      #6 $display("time =%0t , Thread_2 completed",$stime);
      #5 $display("time =%0t , Thread_3 completed",$stime);
      #2 $display("time =%0t , Thread_4 completed",$stime);
    join_none
    #3;
    $display("time = %0t , Join block executed",$stime);
    
    //sequential execution
    #1 $display("time = %0t without fork_join",$time);
    #1 $display("time = %0t Task_1 done",$time);
    #3 $display("time = %0t Task_2 done",$time);
    
  end
    
endmodule

/*
time =0 ,fork Block Begins
time =0 , Thread_1 completed 
time =2 , Thread_4 completed
time = 3 , Join block executed
time = 4 without fork_join
time =5 , Thread_3 completed
time = 5 Task_1 done
time =6 , Thread_2 completed
time = 8 Task_2 done
*/
