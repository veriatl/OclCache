implementation driver(){
call init_tar_model(); 


call CS2RS_matchAll();
call T2TA_matchAll();
call T2TB_matchAll();
call T2TC_matchAll();


call CS2RS_applyAll();
call T2TA_applyAll();
call T2TB_applyAll();
call T2TC_applyAll();


assert (forall t:ref :: {read($tarHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t) ==>   
    (
    !genBy(t, _T2TA, $srcHeap, $tarHeap) &&
    !genBy(t, _T2TB, $srcHeap, $tarHeap) &&
    !genBy(t, _T2TC, $srcHeap, $tarHeap)
    )
     ==> 
    genBy(read($tarHeap, t, FSM$Transition.target), _CS2RS, $srcHeap, $tarHeap) 
     ==>
     read($tarHeap, t, FSM$Transition.target)!=null
    
) ;


}




