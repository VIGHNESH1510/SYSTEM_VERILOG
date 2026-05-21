module mail_box;
  
  logic [3:0] num;
  mailbox mb; 
  // Generic mailbox declaration
  
  task write();
    
    repeat(10) 
    begin
      num = $urandom_range(0,15);
      
      if(mb.num() == 5)
        $display("time=%0t Mailbox is full",$time);
      
      
      mb.put(num); 
      // put() inserts data into mailbox
      // Blocks if mailbox is full
      
      $display("time=%0t mb.put() = %0d",$time,num);
      
      #1;
      // Write operation is faster
    end
    
  endtask
  
  
  task read();
    
    repeat(10) 
    begin
      
      mb.get(num); 
      // get() retrieves data from mailbox
      // Blocks if mailbox is empty

      if(mb.num() == 0)
        $display("time=%0t Mailbox is empty",$time);
      
      $display("time=%0t mb.get() = %0d",$time,num);
      #3;
      // Read operation is slower than write operation
      // Mailbox may become full because data is written faster than it is read
      
    end   
  endtask
    
    
  initial 
  begin
    
    mb = new(5); 
    // Creates a bounded mailbox with capacity 5
    
    fork
      write();
      read();
    join
    
  end
endmodule

/*
OUTPUT 
time =0 mb.put()=5
time =0 mb.get()=5
mailbox is empty

time =1 mb.put()=2
time =2 mb.put()=7
time =3 mb.get()=2
time =3 mb.put()=0
time =4 mb.put()=9
time =5 mb.put()=11
time =6 mb.get()=7
time =6 mb.put()=8
time =7 mb.put()=7
Mailbox is full

time =9 mb.get()=0
time =9 mb.put()=0
Mailbox is full

time =12 mb.get()=9
time =12 mb.put()=9
time =15 mb.get()=11
time =18 mb.get()=8
time =21 mb.get()=7
time =24 mb.get()=14
time =27 mb.get()=1
mailbox is empty
*/
