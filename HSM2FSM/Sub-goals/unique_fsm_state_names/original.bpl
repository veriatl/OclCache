implementation driver(){
call init_tar_model(); 



call SM2SM_matchAll();
call RS2RS_matchAll();
call IS2IS_matchAll();
call IS2RS_matchAll();
call T2TA_matchAll();
call T2TB_matchAll();
call T2TC_matchAll();

call SM2SM_applyAll();
call RS2RS_applyAll();
call IS2IS_applyAll();
call IS2RS_applyAll();
call T2TA_applyAll();
call T2TB_applyAll();
call T2TC_applyAll();


assert (

forall s1:ref :: {read($tarHeap,s1,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s1) ==>
    (forall s2: ref :: {read($tarHeap,s2,alloc)}
      Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$AbstractState), s2) ==>
         s1 != s2 ==> read($tarHeap, s1, FSM$AbstractState.name) != read($tarHeap, s2, FSM$AbstractState.name))
  
) 
;


}






  

