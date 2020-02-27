allPairs :: [(Integer, Integer)]
allPairs = [(x, s - x) | s <- [0 ..], x <- [0 .. s]]
