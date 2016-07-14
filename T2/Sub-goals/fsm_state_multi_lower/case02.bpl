implementation driver(){
call init_tar_model(); 


call IS2IS_matchAll();


call IS2IS_applyAll();




assert (

forall s:ref :: {read($tarHeap,s,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s)
     ==> 
     genBy(s, _IS2IS, $srcHeap, $tarHeap)
     ==>
     !genBy(read($tarHeap, s, FSM$AbstractState.stateMachine), _SM2SM, $srcHeap, $tarHeap)
     ==>
     read($tarHeap, s, FSM$AbstractState.stateMachine)!=null
  
) 
;


}




