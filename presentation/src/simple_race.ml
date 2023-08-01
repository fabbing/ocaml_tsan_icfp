let a = ref 0 and b = ref 0

let d1 () =
  a := 1;
  !b

let d2 () =
  b := 1;
  !a

let main () =
  let h = Domain.spawn d2 in
  let r1 = d1 () in
  let r2 = Domain.join h in
  assert (not (r1 = 0 && r2 = 0))


let spin_wait a =
  while Atomic.get a do
    Domain.cpu_relax ()
  done

let start = Atomic.make false

let main_sync () =
  let h = Domain.spawn (fun () -> Atomic.set start true; d2 ()) in
  spin_wait start;
  let r1 = d1 () in
  let r2 = Domain.join h in
  assert (not (r1 = 0 && r2 = 0))

let _ =
  if Array.length Sys.argv = 1 then
    main ()
  else
    main_sync ()
