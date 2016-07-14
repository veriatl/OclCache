implementation driver(){
call init_tar_model(); 




call IS2IS_matchAll();
call CS2RS_matchAll();


call IS2IS_applyAll();
call CS2RS_applyAll();

assert (

forall s1:ref :: {read($tarHeap,s1,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s1) ==>
   genBy(s1, _IS2IS, $srcHeap, $tarHeap)  ==>
    (forall s2: ref :: {read($tarHeap,s2,alloc)}
      Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s2) ==>
       genBy(s2, _CS2RS, $srcHeap, $tarHeap) ==>
         s1 != s2 ==> read($tarHeap, s1, FSM$AbstractState.name) != read($tarHeap, s2, FSM$AbstractState.name))
  
) 
;


}






  

