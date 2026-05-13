module fork_join;
  
  initial begin
    
    $display("time =%0t ,fork Block Begins",$stime);
    fork  // parallel execution
      $display("time =%0t , Thread_1 completed ",$stime);
      #5 $display("time =%0t , Thread_2 completed",$stime);
      #5 $display("time =%0t , Thread_3 completed",$stime);
      #2 $display("time =%0t , Thread_4 completed",$stime);
    join_any
    #3;
    $display("time = %0t , Join block executed",$stime);
    
    //sequential execution
    #1 $display("time = %0t without fork_join",$time);
    #1 $display("time = %0t Task_1 done",$time);
    #3 $display("time = %0t Task_2 done",$time);
    #5 $display("time = %0t Task_3 done",$time);
    
  end
    
endmodule

/*
OUTPUT
time =0 ,fork Block Begins
time =0 , Thread_1 completed 
time =2 , Thread_4 completed
time = 3 , Join block executed
time = 4 without fork_join
time =5 , Thread_2 completed
time =5 , Thread_3 completed
time = 5 Task_1 done
time = 8 Task_2 done
time = 13 Task_3 done
*/
