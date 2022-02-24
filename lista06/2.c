#define FUNC(A, B) ((A) ? (A) : (B))

int value = 0;

int f() {
  value++;
  return 1;
}

int main()
{
  FUNC(f(), 0) ;
  printf ("%d", value) ;
}
