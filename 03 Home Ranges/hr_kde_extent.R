
library(amt)
library(terra)

data("amt_fisher")

lu <- filter(amt_fisher, name == "Lucile")

hr1 <- hr_kde(lu, trast = make_trast(lu, fact = 1.5))
hr2 <- hr_kde(lu, trast = make_trast(lu, fact = 2.5))
hr3 <- hr_kde(lu, trast = make_trast(lu, fact = 5))

plot(ud1 <- hr_ud(hr1))
plot(ud2 <- hr_ud(hr2))
plot(ud3 <- hr_ud(hr3))

# Extract UD at observed pionts
plot(
  extract(ud1, lu[, c("x_", "y_")])[, 2], 
  extract(ud3, lu[, c("x_", "y_")])[, 2], 
  xlab = "UD 1", ylab = "UD 3"
)

par(mfrow = c(1, 2))
plot(hr1)
plot(hr3)
par(mfrow = c(1, 1))

