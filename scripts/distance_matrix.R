########################### Distance Matrix #############################################

##Distance Matrix Standardization
w1 <- read.csv("dist_matrix.csv", header=T, sep=",")
D <- mean(as.matrix(w1))
gamma <- 0.7
phi <- -(log(1-gamma)/D)
dist_matrix <- exp(-w1*phi)
diag(dist_matrix) <- 0

#Weight List Object
weight_matrix <- data.matrix(dist_matrix)
weight_listw <- mat2listw(weight_matrix, style="W")
objects(weight_listw)
weight_listw