fun multiPairs([], _) = [] | multiPairs(_, []) = [] | multiPairs(start1::final1, start2::final2) = start1 * start2::(multiPairs(final1, final2));

multiPairs([2, 5, 10], [4, 10, 8]);