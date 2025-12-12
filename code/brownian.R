# -------------------------------------------------------
# --- SIMULAZIONE MOTO BROWNIANO 2D --------------------
# -------------------------------------------------------

n <- 1000
t <- 1

# generazione moto browniano 2D
bm_x <- c(0, cumsum(rnorm(n, 0, sqrt(t/n))))
bm_y <- c(0, cumsum(rnorm(n, 0, sqrt(t/n))))
steps <- seq(0, t, length.out = n+1)

# plot statico iniziale (facoltativo)
plot(bm_x, bm_y, type="l", col="blue",
     xlab="X", ylab="Y", main="Moto Browniano 2D")

# -------------------------------------------------------
# --- GIF ANIMATA DEL MOTO BROWNIANO 2D ----------------
# -------------------------------------------------------

library(animation)

ani.options(interval = 0.03)   # velocità animazione (più lenta)
ani.record(reset = TRUE)

# primo frame: plot vuoto
plot(bm_x, bm_y, type="n", xlab="X", ylab="Y",
     main="Moto Browniano 2D",
     xlim=range(bm_x), ylim=range(bm_y))
ani.record()

# costruzione percorso passo-passo
for(i in 2:(n+1)) {
  plot(bm_x[1:i], bm_y[1:i], type="l", col="blue", lwd=2,
       xlab="X", ylab="Y",
       main="Moto Browniano 2D",
       xlim=range(bm_x), ylim=range(bm_y))
  ani.record()
}

# crea la GIF
saveGIF({
  ani.replay()
}, movie.name = "brownian_motion_2D.gif",
   ani.width = 600, ani.height = 600)

cat("GIF salvata come brownian_motion_2D.gif\n")

