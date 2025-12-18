void main() {
  List<int> list1 = [1, 3, 5, 7];
  List<int> list2 = [2, 3, 6, 7, 8];
  List<int> list3 = [0, 5, 9];

  //spread operator
  List<int> combined = [...list1, ...list2, ...list3];

  // Remove duplicates by converting to Set
  List<int> uniqueList = combined.toSet().toList();

  // ascending order
  uniqueList.sort();

  print(uniqueList);
}