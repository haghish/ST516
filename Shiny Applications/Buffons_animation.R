#Lucky Odds

#22
#213
#3408

library(animation)
ani.options(nmax = 22, interval = 0.1)
par(mar = c(3, 2.5, 0.5, 0.2), pch = 20, mgp = c(1.5, 0.5, 0))
buffon.needle(l = 2.5, d = 3, mat = matrix(c(1, 2, 1, 3), 2))


