fun sumLists (start1::final1, start2::final2) = start1 + start2::(sumLists(final1, final2))
| sumLists([], _) = []
| sumLists(_, []) = [];

sumLists([2, 5, 10], [1, 15, 4]);