import 'dart:collection';

typedef IntList = List<int>;
typedef ListMap<X> = Map<X, List<X>>;

void main() {
  IntList l1 = [1, 2, 3, 4, 5];
  print(l1);
  IntList l2 = [1, 2, 3, 4, 5, 6, 7];
  Map<String, List<String>> m1 = {};
  ListMap<String> m2 = {};
  print(m2);
}
