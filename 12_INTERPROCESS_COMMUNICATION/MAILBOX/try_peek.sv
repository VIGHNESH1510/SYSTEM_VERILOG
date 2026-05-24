  bit [3:0] n;
  mailbox #(bit[3:0]) mb;
  
  task put();
    
    n= $random();
    mb.put(n);
    $display("[put()] Data inserted =%0d \n", n);
  endtask
  
  task get();

    $display("[get()] Data count =%0d", mb.num());
    mb.get(n);
    $display("[get()] Data retrieved  =%0d", n);
    $display("[get()] Data count =%0d \n", mb.num());
  endtask
  
  task peek();
   
    $display("[peek()] Data retrieved =%0d",mb.num());
     mb.peek(n);
    $display("[peek()] Data retrieved =%0d", n);
    $display("[peek()] Data count =%0d \n", mb.num());
    
  endtask
  
  task try_peek();
   
    //$display("[try_peek()] Data retrieved =%0d",mb.num());
    if(mb.try_peek(n))
    $display("[try_peek()] Data retrieved =%0d", n);
    else
      $display("[try_peek()] mailbox is empty =%0d", mb.num());
    
  endtask
  
  initial 
    begin
      mb = new(5);
      fork 
      repeat(5) put();
      
      repeat(5) get();
        
      repeat(2) peek();
      
      repeat(2) try_peek();
      join
    end
  
    
  
endmodule

/*
OUTPUT
[put()] Data inserted =4 

[put()] Data inserted =1 

[put()] Data inserted =9 

[put()] Data inserted =3 

[put()] Data inserted =13 

[get()] Data count =5
[get()] Data retrieved  =4
[get()] Data count =4 

[get()] Data count =4
[get()] Data retrieved  =1
[get()] Data count =3 

[get()] Data count =3
[get()] Data retrieved  =9
[get()] Data count =2 

[get()] Data count =2
[get()] Data retrieved  =3
[get()] Data count =1 

[get()] Data count =1
[get()] Data retrieved  =13
[get()] Data count =0 

[peek()] Data retrieved =0
[try_peek()] mailbox is empty =0
[try_peek()] mailbox is empty =0
xmsim: *W,RNQUIE: Simulation is complete.
xcelium> exit
*/
