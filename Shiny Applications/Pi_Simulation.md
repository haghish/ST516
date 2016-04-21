<br>
<hr>

Estimating π using Monte Carlo
------------------------------

The function below was used to simulate the simplified version of 
Buffon's Needles problem, mentioned in Chapter 3 of **Simulation** 
book, by **S. M. Ross**. 



#### Code

```{r}
set.seed(1)

piR <- function(N) {
    x <- runif(N)
    y <- runif(N)
    d <- sqrt(x^2 + y^2)
    return(4 * sum(d < 1.0) / N)
}
```

<br>

