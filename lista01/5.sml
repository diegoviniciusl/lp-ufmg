fun cumSum (start::middleList::final) = start::cumSum(start + middleList::final)
| cumSum(start::[]) = [start]
| cumSum([]) = [];

cumSum([6, 10, 3, 11]);