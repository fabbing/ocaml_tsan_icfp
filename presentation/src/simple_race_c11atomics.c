int a = 0, b = 0;

int d1() {
  atomic_store_release(&a, 1);
  return atomic_load_acquire(&b);
}

int d2() {
  atomic_store_release(&b, 1);
  return atomic_load_acquire(&a);
}
