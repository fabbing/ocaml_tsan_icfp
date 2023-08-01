let race () = (* ... *)

let i () = raise Exit
let h () = i ()
let g () = h ()
let f () =
  try g () with | Exit -> race ()
