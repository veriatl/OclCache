implementation driver(){
call init_tar_model(); 


call T2TB_matchAll();


call T2TB_applyAll();





assert (

forall t:ref :: {read($tarHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t)
  ==> 
  genBy(t, _T2TB, $srcHeap, $tarHeap)
  ==>
  !genBy(read($tarHeap, t, FSM$Transition.stateMachine), _SM2SM, $srcHeap, $tarHeap)
  ==> 
  read($tarHeap, t, FSM$Transition.stateMachine)!=null
) 
;


}




