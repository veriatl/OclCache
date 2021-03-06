implementation driver(){
call init_tar_model(); 



call RS2RS_matchAll();


call T2TC_matchAll();




call RS2RS_applyAll();


call T2TC_applyAll();


assert (forall t:ref :: {read($tarHeap,t,alloc)}
  Seq#Contains(Fun#LIB#AllInstanceFrom($tarHeap, FSM$Transition), t) ==>   
    (
    genBy(t, _T2TC, $srcHeap, $tarHeap)
    )
     ==> 
     (

      genBy(read($tarHeap, t, FSM$Transition.source), _RS2RS, $srcHeap, $tarHeap) 

     )
     ==>
     ((read($tarHeap, t, FSM$Transition.source)!=null ))
    
) ;


}




