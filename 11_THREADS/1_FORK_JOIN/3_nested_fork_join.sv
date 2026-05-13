module fork_join;
  
  initial begin
    
    $display("time =%0t ,Outer fork Begins",$stime);
    fork 
      $display("time =%0t , Thread_1 completed ",$stime);
      
      #5 $display("time =%0t , Thread_2 completed",$stime);
      
      #10 $display("time =%0t , Thread_3 completed",$stime);
      
      begin
        #11 $display("time =%0t , inner fork begins",$time);
      fork
        
        #2 $display("time =%0t , Thread_4 completed",$stime);
        
        #10 $display("time =%0t , Thread_5 completed", $time);
        
      join 
        
        #1 $display("time = %0t , out of inner fork",$time);
      end
      
    join
    
        $display("time = %0t , out of outer fork",$time);
        
    #3  $display("time = %0t , Join block executed",$stime);
    
  end
endmodule

/*
OUPTUT
time =0 ,Outer fork Begins
time =0 , Thread_1 completed 
time =5 , Thread_2 completed
time =10 , Thread_3 completed
time =11 , inner fork begins
time =13 , Thread_4 completed
time =21 , Thread_5 completed
time = 22 , out of inner fork
time = 22 , out of outer fork
time = 25 , Join block executed
*/
