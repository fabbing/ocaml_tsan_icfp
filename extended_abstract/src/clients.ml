let clients = Hashtbl.create 16
let free_id = Atomic.make 0

let clients1 =
  Seq.init 4000 (fun _ -> QCheck.Gen.string)

let clients2 =
  Seq.init 4000 (fun _ -> QCheck.Gen.string)

let record_clients =
  Seq.iter
    (fun c -> Hashtbl.add clients (Atomic.fetch_and_add free_id 1) c)

let () =
  let d1 = Domain.spawn (fun () -> record_clients clients1) in
  let d2 = Domain.spawn (fun () -> record_clients clients2) in
  Domain.join d1;
  Domain.join d2
