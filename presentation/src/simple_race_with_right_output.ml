(* This is the thing you want to compile and run to get the TSan report that we
   show on the slides *)

let a = ref 0 and b = ref 0

let[@inline never] d1 () =
  a := 1;
  !b

let[@inline never] d2 () =
  b := 1;
  !a;; let spin_wait a = while Atomic.get a do Domain.cpu_relax () done;; let start = Atomic.make false;;

let () =
  let h = Domain.spawn (fun () -> Atomic.set start true; d2 ()) in
  spin_wait start; let r1 = d1 () in
  let r2 = Domain.join h in
  assert (not (r1 = 0 && r2 = 0))
