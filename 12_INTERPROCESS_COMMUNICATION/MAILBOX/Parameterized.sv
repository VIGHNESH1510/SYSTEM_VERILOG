module mail_box;
  
  logic [3:0] num;
  
  mailbox #(logic [3:0]) mb; 
  // Parameterized mailbox
  // Only logic[3:0] type data can be stored

  task write();
    num = $random();
    // try_put() does not wait if mailbox is full
    // Non-blocking write operation
    if(mb.try_put(num))
      $display("time=%0t Data inserted = %0d",$time,num);
    
    else 
      $display("time=%0t Mailbox is full",$time); 
    #2;
  endtask
  
  
  task read();

    // try_get() does not wait for data to be available
    // Non-blocking read operation
    if(mb.try_get(num))    
      $display("time=%0t Data retrieved = %0d",$time,num);
    
    else 
      $display("time=%0t Mailbox is empty",$time);
    #4;
    
  endtask
  

  
  initial 
  begin
    
    mb = new(2); 
    // Bounded mailbox with capacity 2
    
    // mb = new();
    // Unbounded mailbox with unlimited capacity
    
    
    repeat(2) read();
    repeat(3)  write();  
    repeat(4) read();
    
  end
  
endmodule

/*
OUTPUT
Mailbox is empty
Mailbox is empty
$time = 8 data inserted = 4
$time = 10 data inserted = 1
Mailbox is full
$time = 14 data retrieved = 4
$time = 18 data retrieved = 1
Mailbox is empty
Mailbox is empty
*/
