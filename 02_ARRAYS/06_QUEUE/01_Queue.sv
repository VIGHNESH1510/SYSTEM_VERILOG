module queue;
  int q1[$]; // unbounded queue
  int q2[$:5]; // bounded queue range 0-5
  initial
    begin
      q1 = '{10,20,30};
      q2 = '{1,22,33,44,5,66,77};
      $display("q1 = %p \nq2 =%p",q1,q2);
      for(int i=0;i<8;i++)
        q1[i] = (i+1)*i;
      $display("q1 = %p",q1);
      
      //q.insert(index,value) inserts elemnet at specified index
      q1.insert(5,25);
      $display("After insertion q1 = %p",q1);
      
      //q.delete(index) delete the element at specified index
      q1.delete(5);
      $display("After deletion q1 = %p",q1);
      
      q1.push_front(99); // push the element in the first location
      q1.push_back(98); // push the element in the back location
      $display("after push q1=%p",q1);
      
      q1.pop_front(); // pop the first element and returns it
      q1.pop_back(); //pop the last element and returns it
      $display("after pop q1=%p",q1);
      
      q1.shuffle(); // shuffles the elements in randomly
      $display("After shuffle q1=%p",q1);
      
    end
endmodule


/*
OUTPUT
# KERNEL: q1 = '{10, 20, 30} 
# KERNEL: q2 ='{1, 22, 33, 44, 5, 66}
# KERNEL: q1 = '{0, 2, 6, 12, 20, 30, 42, 56}
# KERNEL: After insertion q1 = '{0, 2, 6, 12, 20, 25, 30, 42, 56}
# KERNEL: After deletion q1 = '{0, 2, 6, 12, 20, 30, 42, 56}
# KERNEL: after push q1='{99, 0, 2, 6, 12, 20, 30, 42, 56, 98}
# KERNEL: after pop q1='{0, 2, 6, 12, 20, 30, 42, 56}
# KERNEL: After shuffle q1='{20, 56, 0, 30, 12, 42, 6, 2} */
