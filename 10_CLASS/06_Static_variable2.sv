class demo;
  int cnt=0; // memory is not shared
  static int s_cnt=0; // static variable , memory is shared
  
  function void counter();
    cnt++;
    s_cnt++;
    $display("cnt = %0d  s_cnt = %0d \n",cnt,s_cnt);
  endfunction
  
endclass

module tb;
  initial begin
    demo d1 = new;
    demo d2 = new;
    demo d3 = new;
    
    $display("object d1 call");
    d1.counter;
    $display("object d2 call");
    d2.counter;
    $display("object d3 call");
    d3.counter;

  end
endmodule

/*
object d1 call
cnt = 1  s_cnt = 1 

object d2 call
cnt = 1  s_cnt = 2 

object d3 call
cnt = 1  s_cnt = 3 
*/
