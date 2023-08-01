let a = ref 0 and b = ref 0
let m = Mutex.create ()

let d1 () =
  Mutex.lock m;
  a := 1;
  let res = !b in
  Mutex.unlock m;
  res

let d2 () =
  Mutex.lock m;
  b := 1;
  let res = !a in
  Mutex.unlock m;
  res

let main () =
  let h = Domain.spawn d2 in
  let r1 = d1 () in
  let r2 = Domain.join h in
  assert (not (r1 = 0 && r2 = 0))
