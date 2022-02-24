fun allTrue ([]) = false
| allTrue (start::[]) = start
| allTrue (start::final) = start andalso allTrue(final);

allTrue([true, true, false, true]);

allTrue([true, true, true]);