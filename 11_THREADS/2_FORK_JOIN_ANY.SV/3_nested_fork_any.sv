module fork_join_any;
  
  initial begin
    
    $display("time =%0t ,Outer fork Begins",$stime);
    fork 
      #1 $display("time =%0t , Thread_1 completed ",$stime);
      
      #5 $display("time =%0t , Thread_2 completed",$stime);
      
      #10 $display("time =%0t , Thread_3 completed",$stime);
      
      begin
        #11 $display("time =%0t , inner fork begins",$time);
      fork
        
        #2 $display("time =%0t , Thread_4 completed",$stime);
        
        #10 $display("time =%0t , Thread_5 completed", $time);
        
      join_any 
        
        #1 $display("time = %0t , out of inner fork",$time);
      end
      
    join_any
    
        $display("time = %0t , out of outer fork",$time);
        
    #3  $display("time = %0t , Join block executed",$stime);
    
  end
endmodule

/*
OUTPUT
time =0 ,Outer fork Begins
time =0 , Thread_1 completed 
time = 0 , out of outer fork
time = 3 , Join block executed
time =5 , Thread_2 completed
time =10 , Thread_3 completed
time =11 , inner fork begins
time =13 , Thread_4 completed
time = 14 , out of inner fork
time =21 , Thread_5 completed
*/
